import 'package:flutter/material.dart';
import 'package:get/get.dart';

class firstApp extends StatelessWidget {
  const firstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Coding Chef',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstAppPage(),
    );
  }
}

class FirstAppPage extends StatelessWidget {
  const FirstAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('짜잔'),
    );
  }
}
