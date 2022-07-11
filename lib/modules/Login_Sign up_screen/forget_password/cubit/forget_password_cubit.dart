import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:together/models/login_model.dart';
import 'package:together/shared/network/remote/dio_helper.dart';
import 'package:together/shared/network/remote/end_points.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;
  Future<void> forgetpassword({
    required String email,
  }) async {
    emit(ForgetPasswordLoadingState());
    try {
      Response response = await DioHelper.postData(
        url: forgotPassword,
        data: {
          'email': email,
        },
      );
      loginModel = LoginModel.fromJson(response.data);
      emit(ForgetPasswordSuccessState(loginModel));
    } on DioError catch (e) {
      emit(ForgetPasswordErrorState(e.response!.data['message'].toString()));
    }
  }
}
