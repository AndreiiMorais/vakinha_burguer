import 'package:flutter/material.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_textformfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppBar(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: VakinhaTextFormField(
              label: 'Text Form',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          VakinhaButton(
            label: 'entrar',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}