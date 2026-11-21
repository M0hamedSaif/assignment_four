import 'package:flutter/material.dart';
import '../core/app_assets.dart';
import 'home_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 2), () {
  //     if (!mounted) return;
  //     Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Lottie.asset(
          AppAssets.logoAnimation,
          width: 250,
          repeat: false,
          onLoaded: (composition) {
            Future.delayed(composition.duration, () {
              if (!mounted) return;
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            });
          },
        ),
      ),
    );
  }
}

// Scaffold(
// body: Center(
// child: Image.asset(AppAssets.logo, width: 200),
// ),
// );