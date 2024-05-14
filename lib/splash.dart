import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:getfunds/formularios/register.dart';
import 'package:getfunds/vistas/bienvenida.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width*1,
        height: MediaQuery.of(context).size.height*1,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('img/texturaSplash.jpg',),
                fit: BoxFit.cover
            )
        ),
        child: AnimatedSplashScreen(
          splash: Lottie.asset('img/GetFundsGif.json'),
          nextScreen: Bienvenida(),
          duration: 2400,
          splashIconSize: 600,
          splashTransition: SplashTransition.fadeTransition,
        ),
      ),
    );
  }
}
