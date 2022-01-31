import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_textformfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: context.heightTransformer(reducedBy: 85),
                    //funçao do get que faz o media query.. *15
                  ),
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(
                    height: 60,
                  ),
                  VakinhaButton(
                    width: context.widthTransformer(reducedBy: 40),
                    height: 35,
                    label: 'ACESSAR',
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
