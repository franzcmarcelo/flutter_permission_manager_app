import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_permission_manager_app/presentation/providers/providers.dart';

class PermissionsScreen extends StatelessWidget {

  static const String routeName = 'permissions_screen';

  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions'),
        // add box styled for display life cycle state of the app
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: _AppStateTag(),
        ),
      ),
      body: const _PermissionsView(),
    );
  }
}

class _AppStateTag extends StatelessWidget {

  const _AppStateTag();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final appState = ref.watch(appStateProvider);
        return Container(
          decoration: BoxDecoration(
            color: appState == AppLifecycleState.resumed ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(5),
          child: Text(
            'App State: $appState',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        );
      },
    );
  }
}

class _PermissionsView extends ConsumerWidget {

  const _PermissionsView();

  @override
  Widget build(BuildContext context, ref) {

    final permissions = ref.watch(permissionsProvider);

    return ListView(
      children: [
        CheckboxListTile(
          value: permissions.cameraGranted,
          title: const Text('Camera'),
          subtitle: Text(
            '${permissions.camera}',
            style: TextStyle(color: permissions.cameraGranted ? Colors.green : Colors.red),
          ),
          onChanged: (_){
            ref.read(permissionsProvider.notifier).requestCameraAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.photoLibraryGranted,
          title: const Text('Gallery'),
          subtitle: Text(
            '${permissions.photoLibrary}',
            style: TextStyle(color: permissions.photoLibraryGranted ? Colors.green : Colors.red),
          ),
          onChanged: (_){
            ref.read(permissionsProvider.notifier).requestPhotoLibraryAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.sensorsGranted,
          title: const Text('Sensors'),
          subtitle: Text(
            '${permissions.sensors}',
            style: TextStyle(color: permissions.sensorsGranted ? Colors.green : Colors.red),
          ),
          onChanged: (_){
            ref.read(permissionsProvider.notifier).requestSensorsAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.locationGranted,
          title: const Text('Location'),
          subtitle: Text(
            '${permissions.location}',
            style: TextStyle(color: permissions.locationGranted ? Colors.green : Colors.red),
          ),
          onChanged: (_){
            ref.read(permissionsProvider.notifier).requestLocationAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.locationAlwaysGranted,
          title: const Text('Location Always'),
          subtitle: Text(
            '${permissions.locationAlways}',
            style: TextStyle(color: permissions.locationAlwaysGranted ? Colors.green : Colors.red),
          ),
          onChanged: (_){
            ref.read(permissionsProvider.notifier).requestLocationAlwaysAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.locationWhenInUseGranted,
          title: const Text('Location When In Use'),
          subtitle: Text(
            '${permissions.locationWhenInUse}',
            style: TextStyle(color: permissions.locationWhenInUseGranted ? Colors.green : Colors.red),
          ),
          onChanged: (_){
            ref.read(permissionsProvider.notifier).requestLocationWhenInUseAccess();
          },
        ),
      ]
    );
  }
}