import '../pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  String email;
  String password;
  String passwordConfirmation;
  RxBool loading = false.obs;
  var autovalidateMode = AutovalidateMode.disabled.obs;

  void signup() async {
    loading.value = true;

    await Future.delayed(Duration(seconds: 2));

    if (email == 'abc@abc.com') {
      loading.value = false;

      Get.defaultDialog(
        title: 'Signup Failure',
        content: Text('Email already in use'),
      );
    } else {
      loading.value = false;
      Get.off(HomePage());
    }
  }
}
