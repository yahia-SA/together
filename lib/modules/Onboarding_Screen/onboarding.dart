import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:together/modules/shared/date.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Together ",
          body:
              "Hello, welcome to the borrowing world!\n Here you can find what you need",
          image: Image.asset(
            'assets/images/zft34.png',
            width: 450.w,
            height: 450.h,
          ),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "Sharing ",
          body: "Here you can fing what you need\nShare skills, like languages",
          image: Image.asset(
            'assets/images/zft35.png',
            width: 450.w,
            height: 450.h,
          ),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "Our mission ",
          body: "To enjoy our things more\nTo enjoy our neighbours more",
          image: Image.asset(
            'assets/images/zft35.png',
            width: 450.w,
            height: 450.h,
          ),
          decoration: getPageDecoration(),
        ),
      ],
      showSkipButton: true,
      skip: nextbutton('Skip', icon: Icons.skip_next),
      next: nextbutton("next", icon: Icons.arrow_forward),
      done: nextbutton("done", icon: Icons.done_all),
      onDone: () => goToHome(context),
      onSkip: () => goToHome(context),
      dotsDecorator: getDotDecoration(),
      globalBackgroundColor: Colors.white,
      animationDuration: 350,
      skipFlex: 0,
      isTopSafeArea: true,
      nextFlex: 0,
    );
  }
}
