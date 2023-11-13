import 'package:flutter/material.dart';
import 'package:flutter_course/counter%20app/counterProvider.dart';
import 'package:provider/provider.dart';

class counter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Counter Value:',),
            Consumer<Counter>(
              builder: (context, counter, child) => Text(
                '${counter.count}',
                style: const TextStyle(fontSize: 48),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              Provider.of<Counter>(context, listen: false).decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              Provider.of<Counter>(context, listen: false).increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
