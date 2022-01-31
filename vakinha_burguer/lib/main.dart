import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer/app/routes/splash_routers.dart';

void main() {
  runApp(const VakinhaBurguerMainApp());
}

class VakinhaBurguerMainApp extends StatelessWidget {
  const VakinhaBurguerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //projeto feito em GetX, por isso o Get
      title: 'Vakinha Burguer',
      theme: VakinhaUI.theme,
      getPages: [
        ...SplashRouters
            .routers, // os 3 . servem para 'destruir' o arrai e criar ele dentro de outro
      ],
    );
  }
}
