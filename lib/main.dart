import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_codingchef/example/first_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Coding Chef',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              firstApp();
            },
            child: Text('이것'))
      ],
    );
  }
}
