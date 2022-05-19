import 'package:espaco_saude/dicas/service.dart';

import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import 'package:espaco_saude/dicas/ui/empty.dart';

import 'dicas/ui/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Espaço Saúde',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen.withScreenFunction(
        splash: SvgPicture.asset('assets/espaco_saude_load.svg'),
        duration: 3000,
        animationDuration: const Duration(seconds: 5),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.white,
        screenFunction: () async {
          const service = DicaService();
          final dicas = await service.getDicas();
          if (dicas.isNotEmpty) {
            return HomePage(service, dicas);
          }
          return const EmptyPage(service);
        },
      ),
    );
  }
}
