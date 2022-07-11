// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together/models/login_model.dart';
import 'package:together/shared/network/remote/dio_helper.dart';
import 'package:together/shared/network/remote/end_points.dart';
import 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      Response response = await DioHelper.postData(
        url: login,
        data: {
          'email': email,
          'password': password,
        },
      );
      loginModel = LoginModel.fromJson(response.data);
      emit(LoginSuccessState(loginModel));
      print(response.data['data']['user']);
    } on DioError catch (e) {
      emit(LoginErrorState(e.response!.data['message'].toString()));
    }
    // .then((value)
    // {
    //   print(value.data);
    //   loginModel=LoginModel.fromJson(value.data);
    //   emit(LoginSuccessState(loginModel));
    // }).catchError((error)
    // {
    //   print(error.toString());
    //   emit(LoginErrorState(error.toString()));
    // });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }
}
