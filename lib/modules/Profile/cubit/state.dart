// ignore_for_file: camel_case_types

import 'package:together/models/Postmodel.dart';
import 'package:together/models/login_model.dart';
import 'package:together/models/posts_model.dart';
import 'package:together/models/profile_model.dart';

abstract class ProfileStates {
  get error => null;
}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileLoadinguserpostsState extends ProfileStates {}
class ProfileLoadingdeleteuserpostsState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {
  final Profilemodel profilemodel;
  ProfileSuccessState(this.profilemodel);
}

class ProfileSuccessuserpostsState extends ProfileStates {
  final PostsModel postsModel;
  ProfileSuccessuserpostsState(this.postsModel);
}
class ProfileSuccessdeleteuserpostsState extends ProfileStates {
  final PostsModel postsModel;
  ProfileSuccessdeleteuserpostsState(this.postsModel);
}

class ProfileErrorState extends ProfileStates {
  @override
  final String error;

  ProfileErrorState(this.error);
}

class ProfileErroruserpostsState extends ProfileStates {
  @override
  final String error;

  ProfileErroruserpostsState(this.error);
}
class ProfileErrordeleteuserpostsState extends ProfileStates {
  @override
  final String error;

  ProfileErrordeleteuserpostsState(this.error);
}

class ChangePasswordVisibilityState extends ProfileStates {}

class OpenImagePicker extends ProfileStates {}

class ProfileLoadingUpdateUserState extends ProfileStates {}

class ProfileSuccessUpdateUserState extends ProfileStates {
  final Profilemodel profilemodel;

  ProfileSuccessUpdateUserState(this.profilemodel);
}

class ProfileSuccessUpdateUserPasswordState extends ProfileStates {
  final LoginModel loginModel;

  ProfileSuccessUpdateUserPasswordState(this.loginModel);
}

class ProfileErrorUpdateUserState extends ProfileStates {
  @override
  final String error;

  ProfileErrorUpdateUserState(this.error);
}
class ChangeFavoritesState extends ProfileStates {}
class ChangeFavoritesErrorState extends ProfileStates {
  @override
  final String error;
  ChangeFavoritesErrorState(this.error);
}
class ChangeFavoritesSuccessState extends ProfileStates
{
  final Postmodel postmodel;

  ChangeFavoritesSuccessState(this.postmodel);
}
