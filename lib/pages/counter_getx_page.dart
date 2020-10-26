import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_getx_controller.dart';

class CounterGetxPage extends StatelessWidget {
  final CounterGetXController cgxc = Get.put(CounterGetXController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetX<CounterGetXController>(
          builder: (controller) {
            return Text('${cgxc.count}');
          },
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go To OtherPage'),
          onPressed: () => Get.to(OtherGetXPage()),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => cgxc.increment(),
              heroTag: null,
            ),
            SizedBox(width: 10.0),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () => cgxc.decrement(),
              heroTag: null,
            ),
          ],
        ),
      ),
    );
  }
}

class OtherGetXPage extends StatelessWidget {
  final CounterGetXController cgxc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter GetX'),
      ),
      body: Center(
        child: Text(
          '${cgxc.count.value}',
          style: TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}
