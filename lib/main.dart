import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main(){
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookly',
      home:const SplashView(),
    );
  }
}
