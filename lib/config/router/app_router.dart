import 'package:flutter_permission_manager_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/permissions',
      name: PermissionsScreen.routeName,
      builder: (context, state) => const PermissionsScreen(),
    ),
  ],
);