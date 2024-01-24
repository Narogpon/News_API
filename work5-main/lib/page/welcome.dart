import 'package:apiapp/page/login.dart';
import 'package:apiapp/page/newspage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  // ฟังก์ชันเมื่อจบการแสดง Intro
  void _onIntroEnd(context) async {
    Get.to(() => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        pages: [
          PageViewModel(
            title: "BREAKING ข่าวใหม่",
            body: "ข่าว เดือด มัน",
            image: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                    'https://png.pngtree.com/png-vector/20230201/ourmid/pngtree-breaking-news-live-tv-label-logo-png-image_6582038.png'),
              ),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "ยินดีต้อนรับ",
            body: "ข่าวสดใหม่มัน",
            image: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                    'https://static.vecteezy.com/system/resources/thumbnails/024/131/972/small/welcome-handwriting-illustration-of-a-modern-calligraphy-style-premium-vector.jpg'),
              ),
            ),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => Get.to(() => LoginPage()),
        onSkip: () => Get.to(() => NewsPage()),
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        back: const Text('Back', style: TextStyle(fontWeight: FontWeight.w600)),
        skip: const Text('Read News',
            style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600)),
        done:
            const Text('Login', style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color.fromARGB(255, 194, 109, 109),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Color.fromARGB(221, 255, 175, 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
