import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:together/shared/components/date.dart';
class BoardingScreen extends StatelessWidget {
  const BoardingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Together ",
            body: "welcome to the borrowing world!",
            image: SizedBox(
              width: 200.h,
              height: 200.h,
              child: Image.asset(
                'assets/images/zft34.png',
              ),
            ),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Need something?",
            body: "Here you can find what you need",
            image: SizedBox(
              width: 200.h,
              height: 200.h,
              child: Lottie.asset('assets/images/onBoarding.json'),
            ),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Take care!",
            body: "public places is preferred",
            image: SizedBox(
              width: 200.h,
              height: 200.h,
              child: Lottie.asset('assets/images/location.json'),
            ),
            decoration: getPageDecoration(),
          ),
        ],
        showSkipButton: true,
        skip: nextbutton('Skip', icon: Icons.skip_next),
        next: nextbutton("next", icon: Icons.arrow_forward),
        done: nextbutton("done", icon: Icons.done_all),
        onDone: () => submit(context),
        onSkip: () => submit(context),
        dotsDecorator: getDotDecoration(),
        globalBackgroundColor: Colors.white,
        animationDuration: 350,
        skipFlex: 0,
        isTopSafeArea: true,
        nextFlex: 0,
    );
  }
}