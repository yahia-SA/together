

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together/modules/Timeline/FAQ/cubit/states.dart';

class FAQCubit extends Cubit<FAQStates> {
  FAQCubit() : super(FAQInitialState());

  static FAQCubit get(context) => BlocProvider.of(context);


  void changeVisibility(int index) {
    items[index].isExpanded = !items[index].isExpanded;
    
    emit(FAQChangeVisibilityState());
  }
      List<Item> items = [
      Item(
          headr: "What is TOGETHER?",
          body:
              "Well since you ask, communities that help each other are closer, nicer, and friendlier to live in. Together can help make your neighbourhood a nicer place."),
      Item(
          headr: "TOGETHER Registration",
          body:
              "Sign up with your name and your information such as your address ,ID number and your picture."),
      Item(
          headr: "My Account ",
          body:
              "You can update your registered information ,you can also recover your password if you forgot"),
      Item(
          headr: "After SignUp !",
          body:
              "You can use you can use our website/ application  and benefit from sharing things with people by making giveaway post or lend/borrow request."),
      Item(
          headr: "How Can I make giveaway post / borrow request?",
          body:
              "By pressing the + button , choose what do you want? (giveaway or borrow something) , and fill in the required data "),
      Item(
          headr: "What will happen after sharing your post?",
          body:
              "In timeline there will be every giveaway post or borrow request ,People will deal with no mediator between them  "),
      Item(
          headr: "How much does it cost?",
          body:
              "It’s free or a little cost according to each user (depend on post/request)."),
    ];

}class Item {
  final String headr;
  final String body;
  bool  isExpanded;
  Item({
    required this.headr,
    required this.body,
    this.isExpanded = false,
  });
}
