import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
  didChangeAppLifecycleState:

  | State | visible | foreground | background | user input | description |
  |-------|---------|------------|------------|------------| |
  | resumed | true | true | false | true | The app is visible, went from background to foreground, responding to user input. |
  | inactive | true | true | false | false | The app is visible, is in the foreground but not responding to user input (out of focus). |
  | paused | false | false | true | false | The app is not visible, was sent to the background, and not responding to user input. |
  | detached | false | false | false | false | The app is still hosted on a flutter engine but is detached from any host views. |
*/

final appStateProvider = StateProvider<AppLifecycleState>((ref) {
  return AppLifecycleState.resumed;
});