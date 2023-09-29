library watcher_builder;

import 'package:flutter/material.dart';

/// Builds a widget that will watch a [VarWatcher].
///
/// Anytime [watch] object is updated using [notify()] then the builder will
/// be triggered to rebuild.
///
/// [builder] will provide the widget context and current value
class WatcherBuilder<T> extends StatefulWidget {
  /// The watcher you want to watch
  final VarWatcher<T> watch;
  final Widget Function(BuildContext context, T value) builder;
  const WatcherBuilder({super.key, required this.watch, required this.builder});

  @override
  State<WatcherBuilder> createState() => _WatcherState<T>();
}

class _WatcherState<T> extends State<WatcherBuilder<T>> {
  void _watchFunction () {
    if(mounted) {
      setState(() {
        // update ui
      });
    }
  }
  @override
  void initState() {
    widget.watch.addListener(_watchFunction);
    super.initState();
  }

  // @override
  // void dispose() {
  //   widget.watch.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.watch.value);
  }
}

/// Builds a widget that will watch multiple [VarWatcher].
///
/// Anytime any of [watchers] object is updated using [notify()] then the builder will
/// be triggered to rebuild.
///
/// [builder] will provide the widget context
class WatchersBuilder extends StatefulWidget {
  /// The list of watchers you want to watch.
  final List<VarWatcher> watchers;
  final Widget Function(BuildContext context) builder;
  const WatchersBuilder({super.key, required this.watchers, required this.builder});

  @override
  State<WatchersBuilder> createState() => _WatchersBuilderState();
}

class _WatchersBuilderState extends State<WatchersBuilder> {
  void _watchFunction () {
    if(mounted) {
      setState(() {
        // update ui
      });
    }
  }
  @override
  void initState() {
    for(VarWatcher watch in widget.watchers) {
      watch.addListener(_watchFunction);
    }
    super.initState();
  }

  // @override
  // void dispose() {
  //   for(VarWatcher watch in widget.watchers) {
  //     watch.dispose();
  //   }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}


///Watches the given value for any updates.
///
/// Use [notify] to update the listeners.
class VarWatcher<T> extends ChangeNotifier {
  T _value;


  VarWatcher(this._value);


  T get value => _value;


  set value(T value) {
    _value = value;
    notify();
  }

  void notify() {
    notifyListeners();
  }


}
