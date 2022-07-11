// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/models/posts_model.dart';
import 'package:together/modules/PostForm/postForm.dart';
import 'package:together/modules/Timeline/HomePage/Drawer/MyDrawer.dart';
import 'package:together/modules/Timeline/HomePage/cubit/home_cubit.dart';
import 'package:together/modules/Timeline/HomePage/cubit/home_state.dart';
import 'package:together/modules/info/info.dart';
import 'package:together/shared/components/date.dart';
import 'package:together/shared/components/shared_data.dart';
import 'package:together/shared/components/shared_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeErrorState) {
          showToast(text: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        if (HomeCubit.get(context).postsModel != null &&
                state is! HomeLoadingState ||
            state is! SearchLoadingState) {
          return builderWidget(context, HomeCubit.get(context).postsModel!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  builderWidget(context, PostsModel model) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          actions: [
            Container(
                color: Colors.white,
                width: 138.w,
                child: Image.asset(
                  'assets/images/logowtext.png',
                  width: double.infinity.w,
                )),
          ],
          backgroundColor: const Color(textColor2),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(textColor2),
          child: Icon(
            Icons.add,
            size: 45.h,
          ),
          onPressed: () {
            navgigtor(context, PostForm());
          },
        ),
        body: RefreshIndicator(
          color: const Color(textColor2),
          onRefresh: () async {
            return Future.delayed(
              const Duration(microseconds: 500),
              () {
                // HomeCubit.get(context).getHomeData();
                HomeCubit.get(context).getusersearch();
              },
            );
          },
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(40.0.r),
            child: Column(
              children: [
                ListView.separated(
                  itemBuilder: (context, index) =>
                      buildpostsItem(model.datamodel!.data![index], context),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20.0.h,
                  ),
                  itemCount: HomeCubit.get(context)
                      .postsModel!
                      .datamodel!
                      .data!
                      .length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          )),
        ));
  }
}

buildpostsItem(Data data, context) {
  if (data.type == 'Lend') {
    return GiveawayCard(
      imagePath: data.imageCover.toString(),
      description: data.description.toString(),
      category: data.category.toString(),
      city: data.city.toString(),
      duration: data.duration.toString(),
      price: data.price.toString(),
      onPressed: () {
        navgigtor(
            context,
            InfoScreen(
              address: data.user!.address!,
              city: data.user!.city!,
              imagePath: data.user!.yourPicture!,
              username: data.user!.name!,
              phoneNumber: data.user!.phone!,
            ));
      },
      name: 'Giveaway',
      icon: Icons.favorite,
      iconPressed: () => Null,
    );
  } else {
    return BorrowCard(
      imagePath: data.imageCover.toString(),
      description: data.description.toString(),
      category: data.category.toString(),
      city: data.city.toString(),
      duration: data.duration.toString(),
      price: data.price.toString(),
      onPressed: () {
        navgigtor(
            context,
            InfoScreen(
              address: data.user!.address!,
              city: data.user!.city!,
              imagePath: data.user!.yourPicture!,
              username: data.user!.name!,
              phoneNumber: data.user!.phone!,
            ));
      },
      name: 'Borrow Now',
      icon: Icons.favorite,
      iconPressed: () => Null,
    );
  }
}
