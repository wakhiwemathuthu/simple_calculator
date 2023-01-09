import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_calculator/home_page.dart';
import '../bindings/my_bindings.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      title: "Flutter Calculator",
      home: MyHomePage(),
    );
  }
}
