import 'package:get/get.dart';

class CounterObxController extends GetxController {
  RxInt count = 0.obs;
  RxBool mode = false.obs;

  void increment() => count++;
  void decrement() => count--;
}
