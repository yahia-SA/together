import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'postform_state.dart';

class PostformCubit extends Cubit<PostformState> {
  PostformCubit() : super(PostformInitial());
  static PostformCubit get(context) => BlocProvider.of(context);
  String? chosenName, itemCategory,city;
  void itemCategorydata(String bi){
    itemCategory=bi;
    emit(PostformChange());
  }
  void citydata(String newcity){
    city=newcity;
    emit(PostformChange());
  }

  String dropdownvalue = 'Category';
  void change(String? name) {
    if (name == 'Lend') {
      chosenName = name;
    }
    if (name == 'Giveaway') {
      chosenName = 'Giveaway';
    }
    emit(PostformChange());
  }

}
