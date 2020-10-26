import 'package:get/get.dart';

class CounterGetXController extends GetxController {
  RxInt count = 0.obs;

  void increment() => count++;
  void decrement() => count.value--;
}
