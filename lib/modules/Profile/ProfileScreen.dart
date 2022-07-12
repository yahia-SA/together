// ignore_for_file: file_names, must_be_immutable
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/models/posts_model.dart';
import 'package:together/modules/Profile/cubit/cubit.dart';
import 'package:together/modules/Profile/cubit/state.dart';
import 'package:together/modules/Timeline/HomePage/HomePage.dart';
import 'package:together/shared/components/SignOut.dart';
import 'package:together/shared/components/date.dart';
import 'package:together/shared/components/shared_data.dart';
import '../../shared/components/shared_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    Key? key,
  }) : super(key: key);
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();
  var currentPassword = TextEditingController();
  var username = TextEditingController();
  var email = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  String? image;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()
        ..getProfileData()
        ..getuserposts(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          if (state is ProfileSuccessState) {
            username.text = state.profilemodel.datamodel!.data!.name!;
            email.text = state.profilemodel.datamodel!.data!.email!;
            image = state.profilemodel.datamodel!.data!.yourPicture!;
          }
          if (state is ProfileErrorState ||
              state is ProfileErrorUpdateUserState ||
              state is ProfileErroruserpostsState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
          if (state is ProfileSuccessUpdateUserState) {
            showToast(
                text: state.profilemodel.status!, state: ToastStates.SUCCESS);
          }
          if (state is ProfileSuccessUpdateUserPasswordState) {
            logout(context);
          }
          if (state is ProfileLoadingState &&
              (ProfileCubit.get(context).profilemodel == null ||
                  ProfileCubit.get(context).loginModel == null)) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        builder: (context, state) {
          {
            return Scaffold(
              extendBodyBehindAppBar: true,
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: TextButton(
                      onPressed: () async {
                        signOut(context);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Container(
                          width: 108.w,
                          height: 30.h,
                          color: const Color(0xff763aa6),
                          child: const Center(
                            child: AutoSizeText(
                              'Log Out',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () { navgigtor(context, const Home()); },),
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                elevation: 0,
              ),
              body: RefreshIndicator(
                color: const Color(textColor2),
                onRefresh: () async {
                  return Future.delayed(
                    const Duration(milliseconds: 500),
                    () async {
                      ProfileCubit.get(context).getProfileData();
                      ProfileCubit.get(context).getuserposts();
                    },
                  );
                },
                child: Container(
                  width: double.infinity.w,
                  height: double.infinity.h,
                  decoration: const BoxDecoration(
                    color: Color(0xff763aa6),
                  ),
                  child: Center(
                    child: Container(
                      width: 310.w,
                      height: double.infinity.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10.r,
                              spreadRadius: 0.r,
                              blurStyle: BlurStyle.outer)
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 40.h),
                                height: 150.h,
                                width: 120.w,
                                child: image != null
                                    ? Image.network(
                                        image!,
                                        fit: BoxFit.cover,
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              AutoSizeText(
                                username.text,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: double.infinity.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Form(
                                      key: formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (state
                                              is ProfileLoadingUpdateUserState)
                                            const LinearProgressIndicator(),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: InkWell(
                                              onTap: () {
                                                ProfileCubit.get(context)
                                                    .profileImagePicker();
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20.r),
                                                child: Container(
                                                  width: 108.w,
                                                  height: 30.h,
                                                  color:
                                                      const Color(0xff763aa6),
                                                  child: const Center(
                                                    child: AutoSizeText(
                                                      'choose picture',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          const AutoSizeText(
                                            'Username',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff763aa6),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 250.w,
                                            height: 40.h,
                                            child: DefaultFormField(
                                              controller: username,
                                              color: Colors.black,
                                              type: TextInputType.name,
                                              validate: (value) {
                                                if (value!.isEmpty) {
                                                  return 'please enter your Name';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          const AutoSizeText(
                                            'Email',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff763aa6),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 250.w,
                                            height: 40.h,
                                            child: DefaultFormField(
                                              color: Colors.black,
                                              controller: email,
                                              type: TextInputType.emailAddress,
                                              validate: (value) {
                                                if (value!.isEmpty) {
                                                  return 'please enter your email address';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                if (kDebugMode) {
                                                  print(
                                                      "\n\n${username.text}\n\n${ProfileCubit.get(context).profileImage}\n\n${email.text}\n\n");
                                                }
                                                await ProfileCubit.get(context)
                                                    .updateUserData(
                                                  name: username.text,
                                                  email: email.text,
                                                  yourpicture:
                                                      ProfileCubit.get(context)
                                                          .profileImage,
                                                );
                                              }
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              child: Container(
                                                width: 108.w,
                                                height: 30.h,
                                                color: const Color(0xff763aa6),
                                                child: const Center(
                                                  child: AutoSizeText(
                                                    'SETTINGS',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Form(
                                        key: formKey2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const AutoSizeText(
                                              'Current Password',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff763aa6),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 250.w,
                                              height: 40.h,
                                              child: DefaultFormField(
                                                color: Colors.black,
                                                isPassword:
                                                    ProfileCubit.get(context)
                                                        .currentisPassword,
                                                suffix:
                                                    ProfileCubit.get(context)
                                                        .currentsuffix,
                                                suffixPressed: () {
                                                  ProfileCubit.get(context)
                                                      .changeccurrentPasswordVisibility();
                                                },
                                                controller: currentPassword,
                                                type: TextInputType
                                                    .visiblePassword,
                                                validate: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'password is too short';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            const AutoSizeText(
                                              'New Password',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff763aa6),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 250.w,
                                              height: 40.h,
                                              child: DefaultFormField(
                                                color: Colors.black,
                                                isPassword:
                                                    ProfileCubit.get(context)
                                                        .isPassword,
                                                suffix:
                                                    ProfileCubit.get(context)
                                                        .suffix,
                                                suffixPressed: () {
                                                  ProfileCubit.get(context)
                                                      .changePasswordVisibility();
                                                },
                                                controller: newPassword,
                                                type: TextInputType
                                                    .visiblePassword,
                                                validate: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'password is too short';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            const AutoSizeText(
                                              'Confirm password',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff763aa6),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 250.w,
                                              height: 40.h,
                                              child: DefaultFormField(
                                                color: Colors.black,
                                                isPassword:
                                                    ProfileCubit.get(context)
                                                        .confirmisPassword,
                                                suffix:
                                                    ProfileCubit.get(context)
                                                        .confirmsuffix,
                                                suffixPressed: () {
                                                  ProfileCubit.get(context)
                                                      .changeconfirmPasswordVisibility();
                                                },
                                                controller: confirmPassword,
                                                type: TextInputType
                                                    .visiblePassword,
                                                validate: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'password is too short';
                                                  }
                                                  if (value !=
                                                      newPassword.text) {
                                                    return 'password not match';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                          ],
                                        )),
                                    if (state is ProfileLoadingUpdateUserState)
                                      const Center(
                                        child: LinearProgressIndicator(),
                                      )
                                    else
                                      MaterialButton(
                                        onPressed: () async {
                                          if (formKey2.currentState!
                                              .validate()) {
                                           await  ProfileCubit.get(context)
                                                .updateUserPassword(
                                              passwordCurrent:
                                                  currentPassword.text,
                                              password: newPassword.text,
                                              passwordConfirm:
                                                  confirmPassword.text,
                                            );
                                          }
                                        },
                                        color: const Color(0xff763aa6),
                                        child: const AutoSizeText(
                                          'Save Changes',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        width: 108.w,
                                        height: 30.h,
                                        color: const Color(0xff763aa6),
                                        child: const Center(
                                          child: AutoSizeText(
                                            'My Posts',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              state is ProfileSuccessuserpostsState||state is ProfileSuccessdeleteuserpostsState ? SingleChildScrollView(
                                  child: Padding(
                                padding: EdgeInsets.all(10.0.r),
                                child:  Column(
                                        children: [
                                          ListView.separated(
                                            itemBuilder: (context, index) =>
                                                buildpostsItem(
                                                    ProfileCubit.get(context).postsModel!.datamodel!.data![index], context),
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                              height: 20.0.h,
                                            ),
                                            itemCount: ProfileCubit.get(context).postsModel!.datamodel!.data!.length,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                          ),
                                        ],
                                      )
                                    
                              )):const Center(child: CircularProgressIndicator(),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
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
      onPressed: () async => await ProfileCubit.get(context).deleteuserposts(data.sId),
      name: 'Delete',
      iconPressed: () async {
        await ProfileCubit.get(context).changeFavorites(data.sId, data.available);
      },
      icon: data.available! ? Icons.visibility_off : Icons.visibility,
    );
  } else {
    return BorrowCard(
      imagePath: data.imageCover.toString(),
      description: data.description.toString(),
      category: data.category.toString(),
      duration: data.duration.toString(),
      city: data.city.toString(),
      price: data.price.toString(),
      onPressed: () async {
        await ProfileCubit.get(context).deleteuserposts(data.sId);
      },
      name: 'Delete',
      icon: data.available! ? Icons.visibility_off : Icons.visibility,
      iconPressed: () async {
       await ProfileCubit.get(context).changeFavorites(data.sId, data.available);
      },
    );
  }
}
