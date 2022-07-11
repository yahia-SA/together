// ignore_for_file: avoid_print

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:together/models/Postmodel.dart';
import 'package:together/models/login_model.dart';
import 'package:together/models/posts_model.dart';
import 'package:together/models/profile_model.dart';
import 'package:together/modules/Profile/cubit/state.dart';
import 'package:together/modules/Timeline/HomePage/cubit/home_cubit.dart';
import 'package:together/shared/components/SignOut.dart';
import 'package:together/shared/network/remote/dio_helper.dart';
import 'package:together/shared/network/remote/end_points.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  Profilemodel? profilemodel;
  LoginModel? loginModel;
  PostsModel? postsModel;
  Postmodel? postmodel;
  Future<void> getuserposts() async {
    emit(ProfileLoadinguserpostsState());

    try {
      Response response = await DioHelper.getData(
        url: posts,
        token: token,
        query: {"user": iduser},
      );
      postsModel = PostsModel.fromJson(response.data);
      emit(ProfileSuccessuserpostsState(postsModel!));
    } on DioError catch (error) {
      emit(ProfileErroruserpostsState(error.response!.data['message'].toString()));
    }
  }

  void getProfileData() {
    emit(ProfileLoadingState());
    DioHelper.getData(url: profile, token: token).then((value) {
      profilemodel = Profilemodel.fromJson(value.data);
      emit(ProfileSuccessState(profilemodel!));
    }).catchError((e) {
      if (e is DioError) {
        emit(ProfileErrorState(e.response!.data['message'].toString()));
      }
    });
  }

  File? profileImage;
  final picker = ImagePicker();

  void profileImagePicker() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage = File(pickedImage.path);
      emit(OpenImagePicker());
    }
    emit(OpenImagePicker());
  }

  Future<void> updateUserData({
    required String name,
    required String email,
    required File? yourpicture,
  }) async {
    emit(ProfileLoadingUpdateUserState());
    FormData formData = FormData.fromMap({
      'name': name,
      'email': email,
      'YourPicture': await MultipartFile.fromFile(yourpicture!.path,
          filename: yourpicture.path.split('/').last),
    });
    try {
      Response response = await DioHelper.patchData(
        url: update,
        token: token,
        data: formData,
      );
      profilemodel = Profilemodel.fromJson(response.data);
      getProfileData();
      await getuserposts();
      HomeCubit.get(BuildContext).getHomeData;
      emit(ProfileSuccessUpdateUserState(profilemodel!));
    } on DioError catch (e) {
      if (kDebugMode) {
        print("\n${e.response!.data["message"].toString()}\n");
      }
      emit(ProfileErrorUpdateUserState(e.response!.data["message"].toString()));
    }
  }

  Future<void> updateUserPassword({
    required String passwordCurrent,
    required String password,
    required String passwordConfirm,
  }) async {
    emit(ProfileLoadingUpdateUserState());
    try {
      Response response = await DioHelper.patchData(
        url: updatePassword,
        token: token,
        data: {
          'passwordCurrent': passwordCurrent,
          'password': password,
          'passwordConfirm': passwordConfirm,
        },
      );
      loginModel = LoginModel.fromJson(response.data);
      emit(ProfileSuccessUpdateUserPasswordState(loginModel!));
    } on DioError catch (e) {
      if (kDebugMode) {
        print("\n${e.response!.data["message"].toString()}\n");
      }
      emit(ProfileErrorUpdateUserState(e.response!.data["message"].toString()));
    }
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  IconData confirmsuffix = Icons.visibility_outlined;
  bool confirmisPassword = true;
  void changeconfirmPasswordVisibility() {
    confirmisPassword = !confirmisPassword;
    confirmsuffix = confirmisPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

  IconData currentsuffix = Icons.visibility_outlined;
  bool currentisPassword = true;
  void changeccurrentPasswordVisibility() {
    currentisPassword = !currentisPassword;
    currentsuffix = currentisPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

  Future<void> deleteuserposts(data) async {
    emit(ProfileLoadingdeleteuserpostsState());

    try {
      await DioHelper.deleteData(url: 'posts/${data.toString()}', token: token);
      await getuserposts();
      print("\n$data\n");
      emit(ProfileSuccessdeleteuserpostsState(postsModel!));
    } on DioError catch (e) {
      print("\n${e.response!.data['message'].toString()}\n");
      emit(ProfileErrordeleteuserpostsState(
          e.response!.data['message'].toString()));
    }
  }

  Future<void> changeFavorites(sId, available) async {
    log(available.toString());
    available = !available;
    emit(ChangeFavoritesState());
    try {
      Response response = await DioHelper.patchData(
        url: 'posts/hide/${sId.toString()}',
        token: token,
        data: {"available": available},
      );
      await getuserposts();
      postmodel = Postmodel.fromJson(response.data);
      emit(ChangeFavoritesSuccessState(postmodel!));
      {
        return Future.delayed(
          const Duration(microseconds: 0),
          () => HomeCubit.get(BuildContext).getHomeData(),
        );
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print("\n${e.response!.data["message"].toString()}\n");
      }
      emit(ChangeFavoritesErrorState(e.response!.data["message"].toString()));
    }
  }
}
