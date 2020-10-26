import '../controllers/counter_builder_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterBuilderPage extends StatelessWidget {
  final CounterBuilderController cbc = Get.put(CounterBuilderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<CounterBuilderController>(
          builder: (controller) => Text('${controller.count}'),
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go To OtherPage'),
          onPressed: () => Get.to(OtherBuilderPage()),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => cbc.increment(),
              heroTag: null,
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () => cbc.decrement(),
              heroTag: null,
            )
          ],
        ),
      ),
    );
  }
}

class OtherBuilderPage extends StatelessWidget {
  final CounterBuilderController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Builder'),
      ),
      body: Center(
        child: Text(
          '${c.count}',
          style: TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}
