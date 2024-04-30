import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/home_widgets.dart';
import '../screens.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permission Manager App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.pushNamed(PermissionsScreen.routeName);
            },
          ),
        ],
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: CustomScrollView(
        slivers: [
          MainMenu()
        ],
      ),
    );
  }
}