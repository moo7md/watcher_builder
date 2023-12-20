
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

## NEW!

With version 1.1.0 now you can create a `VarWatcher` instance of any type using the getter `.watch` which will make it easy for you to watch your variable. In addition, with 1.1.0 you can build watchers with much simpler methods. For example, you can  
invoke  `.build()` method on your watcher and pass in the builder function.

```dart
final watcher = 0.watch;
// This will rebuild automaticlly whenever notify is invoked on watcher
Widget watcherBuilder = watcher.build((value) => Text('value = $value'));
```
Furthermore, we made builder even simpler by introducing a new operator on `VarWatcher`.

```dart
Widget simple = watcher >> (value) => Text('value = $value');
```
Similarly, if you declare a list of `VarWatcher`s you can also invoke the same method and operator.

```dart
final watchers = [
	0.watch,
	0.watch,
	0.watch,
];
Widget watchersBuilder = watchers.build(
	() => Column(children: watchersBuilder.map((w) => 
	Text('value = ${w.value}')).toList()));
// or
Widget simple2 = watchers >> Column(children: watchersBuilder.map((w) => 
	Text('value = ${w.value}')).toList());
```
## Features

WatcherBuilder is the simplest state management in flutter. All you have to do  
is declare a VarWatcher, use it inside a WatcherBuilder and call notify anytime  
you want to update/rebuild its widget.

## Usage

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

You can also use WatchersBuilder if you want to watch multiple VarWatchers