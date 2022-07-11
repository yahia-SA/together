part of 'contact_us_cubit.dart';

@immutable
abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}

class ContactUsLoadingState extends ContactUsState {}

class ContactUsSuccessState extends ContactUsState {
  final LoginModel loginModel;

  ContactUsSuccessState(this.loginModel);
}

class ContactUsErrorState extends ContactUsState {
  final String error;

  ContactUsErrorState(this.error);
}
