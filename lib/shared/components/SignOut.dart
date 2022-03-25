import 'package:together/modules/Login_Sign%20up_screen/login/Loginscreen.dart';
import 'package:together/shared/components/date.dart';
import 'package:together/shared/network/local/cache_helper.dart';

void signOut(context) {
  CacheHelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
      goToHome(
        context,
        LoginScreen(),
      );
    }
  });
}

String token = '';
