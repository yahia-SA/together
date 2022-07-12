import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together/models/login_model.dart';
import 'package:together/shared/components/SignOut.dart';
import 'package:together/shared/network/remote/dio_helper.dart';
import 'package:together/shared/network/remote/end_points.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());
  static ContactUsCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;
  Future<void> contactUsmessage({
    required String name,
    required String email,
    required String message,
  }) async {
    emit(ContactUsLoadingState());
    try {
      Response response = await DioHelper.postData(
        url: contactus,
        token: token,
        data: {
          'name': name,
          'email': email,
          'message': message,
        },
      );
      loginModel = LoginModel.fromJson(response.data);
      emit(ContactUsSuccessState(loginModel));
    } on DioError catch (e) {
      emit(ContactUsErrorState(e.response!.data['message'].toString()));
    }
  }
}
