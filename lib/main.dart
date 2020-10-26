import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/counter_builder_page.dart';
import 'pages/counter_getx_page.dart';
import 'pages/counter_obx_page.dart';
import 'pages/signup_page.dart';
import 'pages/rxvalues_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () => Get.to(CounterBuilderPage()),
                child: Text(
                  'Counter Builder',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              ElevatedButton(
                onPressed: () => Get.to(CounterGetxPage()),
                child: Text(
                  'Counter GetX',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              ElevatedButton(
                onPressed: () => Get.to(CounterObxPage()),
                child: Text(
                  'Counter Obx',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              ElevatedButton(
                onPressed: () => Get.to(RxValuesPage()),
                child: Text(
                  'Rx Values',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              ElevatedButton(
                onPressed: () => Get.to(SignupPage()),
                child: Text(
                  'Signup DEMO',
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
