import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:together/models/Postmodel.dart';
import 'package:together/models/posts_model.dart';
import 'package:together/modules/Timeline/HomePage/cubit/home_state.dart';
import 'package:together/shared/components/SignOut.dart';
import 'package:together/shared/components/date.dart';
import 'package:together/shared/network/remote/dio_helper.dart';
import 'package:together/shared/network/remote/end_points.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  PostsModel? postsModel;
  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    try {
      Response response = await DioHelper.getData(
          url: posts, token: token, query: {"available": true});
      postsModel = PostsModel.fromJson(response.data);
      emit(HomeSuccessState(postsModel!));
    } on DioError catch (error) {
      emit(HomeErrorState(error.response!.data['message'].toString()));
    }
  }

  String? type, itemCategory, city, chosenName;
  void itemCategorydata(String bi) {
    itemCategory = bi;
    emit(PostformChange());
  }

  void citydata(String newcity) {
    city = newcity;
    emit(PostformChange());
  }

  File? image;
  final picker = ImagePicker();
  // Implementing the image picker
  void imagePicker() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      emit(OpenImagePicker());
    }
    emit(OpenImagePicker());
  }

  void change(String? name) {
    if (name == 'Lend') {
      type = name;
    }
    if (name == 'Giveaway') {
      type = 'Giveaway';
    }
    emit(PostformChange());
  }

  late Postmodel postmodel;
  Future<void> postform({
    required String name,
    required String duration,
    required String price,
    required String city,
    required String type,
    required String description,
    required String category,
    required String user,
    required File? imageCover,
  }) async {
    emit(PostformLoading());
    FormData formData = FormData.fromMap({
      'name': name,
      'duration': duration,
      'price': price,
      'user': user,
      'city': city,
      'type': type,
      'description': description,
      'category': category,
      'imageCover': await MultipartFile.fromFile(imageCover!.path,
          filename: imageCover.path.split('/').last),
    });
    try {
      Response response = await DioHelper.postData(
        url: posts,
        data: formData,
        token: token,
      );
      postmodel = Postmodel.fromJson(response.data);
      if (response.data['status'] == 'Success') {
        await getHomeData();
      }
      emit(PostformSuccessState(postmodel));
    } on DioError catch (e) {
      emit(PostformErrorState(e.response!.data['message'].toString()));
    }
  }

  String dropdownvalue = 'Category';
  void selectType(String? name) {
    if (name == 'Lend') {
      chosenName = name;
    }
    if (name == 'Giveaway') {
      chosenName = 'Giveaway';
    }
    emit(DrawerChangeState());
  }

  String? categoryselectedItems;
  void itemChange(x) {
    categoryselectedItems = x;
    emit(DrawerChangeState());
  }

  String? cityselectedItems;
  void cityChange(x) {
    cityselectedItems = x;
    emit(DrawerChangeState());
  }

  Future<void> getusersearch({
    String? type,
    String? city,
    String? category,
  }) async {
    emit(SearchLoadingState());
    try {
      Response response =
          await DioHelper.getData(url: posts, token: token, query: {
        "type": type,
        "city": city,
        "category": category,
      });
      postsModel = PostsModel.fromJson(response.data);
      log(response.data.toString());
      if (postsModel!.datamodel!.data!.isEmpty) {
        await getHomeData();
        showToast(text: 'Not Found', state: ToastStates.ERROR);
      }
      log(postsModel!.datamodel!.data!.map((element) => element.description).toString());
      emit(SearchSuccessState(postsModel!));
    } on DioError catch (e) {
      showToast(text: 'not found yet', state: ToastStates.ERROR);
      await getHomeData();
      emit(SearchErrorState(e.response!.data['message'].toString()));
    }
  }
}
