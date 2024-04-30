import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: const [
        _MenuItem(
          title: 'Camera',
          icon: Icons.camera_alt,
          routeName: '',
        ),
        _MenuItem(
          title: 'Gallery',
          icon: Icons.photo_library,
          routeName: '',
        ),
        _MenuItem(
          title: 'Sensors',
          icon: Icons.sensors,
          routeName: '',
        ),
        _MenuItem(
          title: 'Location',
          icon: Icons.location_on,
          routeName: '',
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {

  final String title;
  final IconData icon;
  final String routeName;

  const _MenuItem({
    required this.title,
    required this.icon,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        context.pushNamed(routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [colors.primary, Colors.lightBlue],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: colors.onPrimary,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: colors.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

}