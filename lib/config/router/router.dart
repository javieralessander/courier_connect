import 'package:courier_connect/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/home', routes: <GoRoute>[
  GoRoute(
    path: '/home',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/mapItems',
    name: MapItems.name,
    builder: (context, state) => const MapItems(),
  ),
]);
