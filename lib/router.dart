import 'package:go_router/go_router.dart';
import 'Screens/EditProfilePage.dart';
import 'Screens/ProfileViewPage.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'profile',
      builder: (_, __) => const ProfileViewPage(),
    ),
    GoRoute(
      path: '/edit',
      name: 'edit',
      builder: (_, __) => const EditProfilePage(),
    ),
  ],
);
