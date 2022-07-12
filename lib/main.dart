// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/modules/Login_Sign%20up_screen/login/Loginscreen.dart';
import 'package:together/modules/Timeline/HomePage/HomePage.dart';
import 'package:together/modules/Timeline/HomePage/cubit/home_cubit.dart';
import 'package:together/shared/components/SignOut.dart';
import 'package:together/shared/network/local/cache_helper.dart';
import 'package:together/shared/network/remote/dio_helper.dart';
import 'modules/Onboarding_Screen/onboarding.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  var onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  iduser = CacheHelper.getData(key: 'iduser');
  if (onBoarding != null) {
    if (token != null) {
      widget = const Home();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = const BoardingScreen();
  }
  BlocOverrides.runZoned(() => runApp(
      // DevicePreview(
      //   enabled: true, builder: (context) =>
      MyApp(startWidget: widget)), blocObserver: AppBlocObserver());
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({Key? key, required this.startWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, widget) => BlocProvider(
        create: (context) => HomeCubit()..getHomeData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Cairo',
            primarySwatch: Colors.deepPurple,
          ),
          home: startWidget,
        ),
      ),
    );
  }
}
