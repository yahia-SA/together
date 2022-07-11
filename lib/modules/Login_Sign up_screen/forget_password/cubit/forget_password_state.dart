part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {
  final LoginModel loginModel;

  ForgetPasswordSuccessState(this.loginModel);
}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final String error;

  ForgetPasswordErrorState(this.error);
}
