import 'package:assignment_four/core/app_theme.dart';
import 'package:assignment_four/screens/home_screen.dart';
import 'package:assignment_four/screens/splash_screen.dart';
import 'package:assignment_four/widgets/app_fab.dart';
import 'package:assignment_four/widgets/custom_button.dart';
import 'package:assignment_four/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'core/app_colors.dart';
import 'core/app_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context)=>SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}



