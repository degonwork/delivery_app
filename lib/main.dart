import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/helper/binding.dart';
import 'package:flutter_firebase/view/controller_view.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const Scaffold(
        body: ControllerView(),
      ),
      initialBinding: Binding(),
      theme: ThemeData(
        fontFamily: 'SourceSans',
      ),
    );
  }
}
