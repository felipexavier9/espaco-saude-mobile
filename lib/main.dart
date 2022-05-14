import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import 'package:espaco_saude/ui/empty.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Espaço Saúde',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: AnimatedSplashScreen(
          splash: SvgPicture.asset('assets/espaco_saude_load.svg'),
          nextScreen: const EmptyPage(),
          duration: 3000,
          animationDuration: const Duration(seconds: 3),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.bottomToTopJoined,
          backgroundColor: Colors.white,
        )
    );
  }
}