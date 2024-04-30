import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_permission_manager_app/config/config.dart';
import 'package:flutter_permission_manager_app/presentation/providers/providers.dart';
void main() {
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerStatefulWidget {

  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}


// The mixin WidgetsBindingObserver allow us to listen to the app lifecycle state
class MainAppState extends ConsumerState<MainApp> with WidgetsBindingObserver {

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

    ref.read(appStateProvider.notifier).update((_) => state);

    if(state == AppLifecycleState.resumed) {
      // The app crashes only when set the permission to denied (don't allow) from the settings (outside the app).
      ref.read(permissionsProvider.notifier).checkPermissions();
    }

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
