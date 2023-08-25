<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.
WatcherBuilder is the simplest state management in flutter. All you have to do
is declare a VarWatcher, use it inside a WatcherBuilder and call notify anytime
you want to update/rebuild its widget.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
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
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.

You can also use WatchersBuilder if you want to watch multiple VarWatchers
