import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together/modules/Timeline/HomePage/Drawer/cubit/states.dart';

class DrawerCubit extends Cubit<DrawerStates> {
  DrawerCubit() : super(DrawerInitialState());

  static DrawerCubit get(context) => BlocProvider.of(context);
  String? chosenName;
  String dropdownvalue = 'Category';
  void change(String? name) {
    if (name == 'Lend') {
      chosenName = name;
    }
    if (name == 'Giveaway') {
      chosenName = 'Giveaway';
    }
    emit(DrawerChangeState());
  }

  var categoryselectedItems=[];
  void itemChange(x) {
    categoryselectedItems.remove(x);
    emit(DrawerChangeState());
  }

 
  List<Object?> cityselectedItems=[];
  void cityChange(x) {
    cityselectedItems.remove(x);
    emit(DrawerChangeState());
  }


}
