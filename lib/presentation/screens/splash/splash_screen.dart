import 'dart:async';

import 'package:flutter/material.dart';
import 'package:arts_home/core/screens.dart' as screens;
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
class SplashScreen extends StatefulWidget {
  
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4),
            ()=>Navigator.pushNamedAndRemoveUntil(context, screens.homeLayout, (route) => false));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SvgPicture.asset(
            "assets/movie-videos-icon.svg",
          color: Colors.pink,
          height: 20.h,
          width: 30.w,
        ),
      ),
    );
  }
}
