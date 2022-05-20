import 'package:espaco_saude/dicas/service.dart';

import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import 'dicas/ui/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Espaço Saúde',
      theme: ThemeData(primarySwatch: Colors.cyan),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        nextScreen: HomePage(const DicaService()),
        splash: SvgPicture.asset('assets/espaco_saude_load.svg'),
        animationDuration: const Duration(seconds: 3),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.white,
      )
    );
  }
}