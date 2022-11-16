import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surah_munjiat_v2/Constant/color.dart';
import 'package:surah_munjiat_v2/Screen/Homepage/homepage_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    onLoading();
  }

  onLoading() {
    Timer(const Duration(seconds: 2), () {
      Get.off(() => const Homepage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/main_icon.png',
              height: 200,
              width: 200,
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: LinearProgressIndicator(
                color: primaryColor,
                backgroundColor: whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
