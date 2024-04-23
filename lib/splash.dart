import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:getfunds/formularios/register.dart';

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
              splash: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/GetFundsLogoPequeño.png')
                  )
                ),
              ),
              nextScreen: Register(),
            duration: 5000,
            splashIconSize: 600,
            splashTransition: SplashTransition.decoratedBoxTransition,
            animationDuration: const Duration(seconds: 2),
          ),
        ),
      ],
    );
  }
}
