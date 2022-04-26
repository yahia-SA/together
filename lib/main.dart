import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/modules/Login_Sign%20up_screen/login/Loginscreen.dart';
import 'package:together/modules/Timeline/HomePage/HomePage.dart';
import 'package:together/shared/components/SignOut.dart';
import 'package:together/shared/network/local/cache_helper.dart';
import 'package:together/shared/network/remote/dio_helper.dart';
import 'modules/Onboarding_Screen/onboarding.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  DioHelper.init();
  await CacheHelper.init();

  Widget widget;

   var onBoarding = CacheHelper.getData(key: 'onBoarding');
   token = CacheHelper.getData(key: 'token');
  if(onBoarding!=null)
  {
    if(token!=null) {
      widget = const Home();
    } else {
      widget = LoginScreen();
    }
  } else
    {
      widget = const BoardingScreen();
    }


  runApp(DevicePreview(enabled: true, builder: (context) => MyApp(startWidget: widget
)));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({Key? key, required this.startWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Cairo',
          primarySwatch: Colors.deepPurple,
        ),
        home: startWidget,
      ),
    );
  }
}
