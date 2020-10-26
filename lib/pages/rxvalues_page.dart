import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class User {
  String name, last;
  int age;
  User({this.name, this.last, this.age});

  @override
  String toString() {
    return '$name $last, $age years old';
  }
}

class RxValuesPage extends StatelessWidget {
  final user = User(name: 'John', last: 'Doe', age: 33).obs;

  void rxString() {
    final RxString name = 'GetX'.obs;
    print('name: $name');
    name.value = 'Hey';
    print('name: $name');
    name('Hello');
    print('name: $name');
    print('name: ${name()}');
  }

  void rxInt() {
    RxInt count = 0.obs;
    print('count: $count');
    count.value++;
    print('count: $count');
    count++;
    print('count: $count');
    print('count > 0: ${count > 0}');

    final number = 12.obs;

    print(number.value == 12);
  }

  void rxBool() {
    final RxBool flag = false.obs;
    print('flag: $flag');
    flag.toggle();
    print('flag: $flag');
    print('flag: ${flag.value}');
  }

  void rxList() {
    final RxList<int> abc = [0, 1, 2].obs;
    print(abc);
    print('json: ${jsonEncode(abc)}, type: ${abc.runtimeType}');
    abc.add(12);
    print('${jsonEncode(abc)}');
    print(abc[3]);
  }

  void rxCustomClass() async {
    print('user: $user');
    user.value.name = 'Roi';
    print('user: $user');
    user.refresh();
    print('user: $user');
    await Future.delayed(Duration(seconds: 2));
    user.update((val) {
      val.last = 'ROE';
    });
    print('user: $user');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips'),
      ),
      body: Center(
          child: IntrinsicWidth(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              child: Text(
                'RxString',
                style: TextStyle(fontSize: 18.0),
              ),
              onPressed: rxString,
            ),
            ElevatedButton(
              child: Text(
                'RxInt',
                style: TextStyle(fontSize: 18.0),
              ),
              onPressed: rxInt,
            ),
            ElevatedButton(
              child: Text(
                'RxBool',
                style: TextStyle(fontSize: 18.0),
              ),
              onPressed: rxBool,
            ),
            ElevatedButton(
              child: Text(
                'RxList',
                style: TextStyle(fontSize: 18.0),
              ),
              onPressed: rxList,
            ),
            ElevatedButton(
              child: Text(
                'RxClass',
                style: TextStyle(fontSize: 18.0),
              ),
              onPressed: rxCustomClass,
            ),
            SizedBox(height: 20.0),
            Obx(
              () => Text(
                user.toString(),
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
