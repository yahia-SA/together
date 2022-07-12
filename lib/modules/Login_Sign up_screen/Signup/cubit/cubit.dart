
// ignore_for_file: unused_import

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:together/models/login_model.dart';
import 'package:together/shared/network/remote/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import 'states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;

  Future<void> userSignUp({
    required String name,
    required String email,
    required String password,
    required String passwordconfirm,
    required String phone,
    required String birthday,
    required String city,
    required String address,
    required String idnumber,
    required File? yourpicture,
    required File? idpicture,

  })    async {
    emit(SignUpLoadingState());
      // var image = new  FormData.fromMap({'YourPicture': await MultipartFile.fromFile(yourpicture.path, filename: yourpicture.path.split('/').last,contentType: MediaType("image","jpg"))
      //     ,});
      //     var image2= new FormData.fromMap({'IDPicture': await MultipartFile.fromFile(idpicture.path, filename: idpicture.path.split('/').last,contentType: MediaType("image","jpg")),
      //     });
      FormData formData =FormData.fromMap({
          'name': name,
          'email': email,
          'password': password,
          'passwordConfirm': passwordconfirm,
          'phone': phone,
          'BirthDate': birthday,
          'city': city,
          'address': address,
          'IDNumber': idnumber,
          'YourPicture': await MultipartFile.fromFile(yourpicture!.path, filename: yourpicture.path.split('/').last),
          'IDPicture': await MultipartFile.fromFile(idpicture!.path, filename: idpicture.path.split('/').last),
    });
try{ Response response= await
        DioHelper.postData(
        url: signup,
        data: formData,);
        loginModel=LoginModel.fromJson(response.data);
        emit(SignUpSuccessState(loginModel));
         }on DioError catch(e){
          emit(SignUpErrorState(e.response!.data['message'].toString()));
         }
      // .then((value)
      // {
      //     print(value.data);
        
      //   loginModel = LoginModel.fromJson(value.data);
      //   emit(SignUpSuccessState(loginModel));
      // }).catchError((error)
      // {
      //     print(error.toString());
      //   emit(SignUpErrorState(error.toString()));
      // }
      // );
    }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
    IconData confirmsuffix = Icons.visibility_outlined;
  bool confirmisPassword = true;
  void changeconfirmPasswordVisibility() {
    confirmisPassword = !confirmisPassword;
    confirmsuffix =
        confirmisPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SignUpChangePasswordVisibilityState());
  }


  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SignUpChangePasswordVisibilityState());
  }
  String? city;
  // birthday;
  // void birthdaydata(bi){
  //   birthday=bi;
  //   emit(SignUpBirthdayState());
  // }
  void citydata(String newcity){
    city=newcity;
    emit(SignUpCityState());
  }
  File? idImage,profileImage;
  final picker=ImagePicker();
  // Implementing the image picker
  void iDImagePicker()  async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
        if(pickedImage!=null){
        idImage = File(pickedImage.path);
       emit(OpenImagePicker());
    }
           emit(OpenImagePicker());
  }
  void profileImagePicker()  async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
        if(pickedImage!=null){
        profileImage = File(pickedImage.path);
       emit(OpenImagePicker());
    }
           emit(OpenImagePicker());
  }
  }
