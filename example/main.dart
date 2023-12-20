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
    final counter = 0.watch;
    final counters = [
      0.watch,
      0.watch,
      0.watch,
    ];
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // example 1: Basic watcher builder
                  WatcherBuilder(
                    watch: counter,
                    builder: (context, value) => Text('Counter = $value'),
                  ),
                  // example 2: Simple builder function from variable
                  counter.build((value) => Text('Counter = $value')),
                  // example 3: even simpler builder operator
                  counter >> (value) => Text('Counter = $value'),
                  OutlinedButton(
                    onPressed: () {
                      counter.value++;
                      counter.notify();
                    },
                    child: const Text('Increment'),
                  )
                ],
              ),
              const SizedBox(width: 100),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // example 1: Basic watcher builder
                  WatchersBuilder(
                    watchers: counters,
                    builder: (context) {
                      return Column(
                        children: counters
                            .map((w) => Text('Counter = ${w.value}'))
                            .toList(),
                      );
                    },
                  ),
                  // example 2: Simple builder function from variable
                  counters.build(() {
                    return Column(
                      children: counters
                          .map((w) => Text('Counter = ${w.value}'))
                          .toList(),
                    );
                  }),
                  // example 3: even simpler builder operator
                  counters >>
                      () {
                        return Column(
                          children: counters
                              .map((w) => Text('Counter = ${w.value}'))
                              .toList(),
                        );
                      },
                  OutlinedButton(
                    onPressed: () {
                      for (var c in counters) {
                        c.value += 1 + counters.indexOf(c);
                      }
                    },
                    child: const Text('Increment'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
