import 'package:together/models/Postmodel.dart';
import 'package:together/models/posts_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final PostsModel postsModel;

  HomeSuccessState(this.postsModel);
}

class HomeErrorState extends HomeStates {
  final String error;

  HomeErrorState(this.error);
}

class PostformLoading extends HomeStates {}

class PostformChange extends HomeStates {}

class OpenImagePicker extends HomeStates {}

class SearchLoadingState extends HomeStates {}

class SearchSuccessState extends HomeStates {
  final PostsModel postsModel;

  SearchSuccessState(this.postsModel);
}

class SearchErrorState extends HomeStates {
  final String error;

  SearchErrorState(this.error);
}

class PostformSuccessState extends HomeStates {
  final Postmodel postmodel;

  PostformSuccessState(this.postmodel);
}

class PostformErrorState extends HomeStates {
  final String error;

  PostformErrorState(this.error);
}

class DrawerLoadingState extends HomeStates {}

class DrawerErrorState extends HomeStates {
  final String error;
  DrawerErrorState(this.error);
}

class DrawerSuccessState extends HomeStates {
  final PostsModel postsModel;
  DrawerSuccessState(this.postsModel);
}

class DrawerChangeState extends HomeStates {}
