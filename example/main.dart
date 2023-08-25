import 'package:flutter/material.dart';
import 'package:watcher_builder/watcher_builder.dart';

void main() {
  runApp(const MaterialApp(
    home: Example(),
  ));
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = VarWatcher(0);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WatcherBuilder(
              watch: counter,
              builder: (context, value) => Text('Counter = $value'),
            ),
            OutlinedButton(
              onPressed: () {
                counter.value++;
                counter.notify();
              },
              child: const Text('Increment'),
            )
          ],
        ),
      ),
    );
  }
}
