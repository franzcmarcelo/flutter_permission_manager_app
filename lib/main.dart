import 'package:flutter/material.dart';
import 'package:flutter_permission_manager_app/config/config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {

  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    print('State: $state');
    /*
      | State | visible | foreground | background | user input | description |
      |-------|---------|------------|------------|------------| |
      | resumed | true | true | false | true | The app is visible, went from background to foreground, responding to user input. |
      | inactive | true | true | false | false | The app is visible, is in the foreground but not responding to user input (out of focus). |
      | paused | false | false | true | false | The app is not visible, was sent to the background, and not responding to user input. |
      | detached | false | false | false | false | The app is still hosted on a flutter engine but is detached from any host views. |
    */
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
