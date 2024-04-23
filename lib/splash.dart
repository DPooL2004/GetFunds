import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:getfunds/formularios/register.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img/texturaSplash.jpg'),
              fit: BoxFit.cover
            )
          ),
        ),
        Positioned(
          child: AnimatedSplashScreen(
              splash: Lottie.asset('img/GetFundsGif.json'),
              nextScreen: Register(),
            duration: 2400,
            splashIconSize: 600,
            splashTransition: SplashTransition.fadeTransition,
          ),
        ),
      ],
    );
  }
}
