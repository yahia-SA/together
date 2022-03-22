import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  // LoginModel loginModel;

  void userSignUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String id,
    required String address,
  }) {
    emit(SignUpLoadingState());
    //
    //   DioHelper.postData(
    //     url: SignUp,
    //     data:
    //     {
    //       'name': name,
    //       'email': email,
    //       'password': password,
    //       'phone': phone,
    //     },
    //   ).then((value)
    //   {
    //     print(value.data);
    //     loginModel = LoginModel.fromJson(value.data);
    //     emit(SignUpSuccessState(loginModel));
    //   }).catchError((error)
    //   {
    //     print(error.toString());
    //     emit(SignUpErrorState(error.toString()));
    //   });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SignUpChangePasswordVisibilityState());
  }
  String? birthday,city;
  void birthdaydata(String bi){
    birthday=bi;
    emit(SignUpBirthdayState());
  }
  void citydata(String newcity){
    city=newcity;
    emit(SignUpCityState());
  }
  File? image;
  final picker=ImagePicker();
  // Implementing the image picker
  Future<void> openImagePicker() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
        if(pickedImage!=null){
        image = File(pickedImage.path);
       emit(OpenImagePicker());
    }
  }
  }
