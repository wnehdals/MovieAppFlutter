import 'package:first_flutter/present/screen/favorite_screen.dart';
import 'package:first_flutter/present/screen/main_screen.dart';
import 'package:first_flutter/present/screen/search_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const MainScreen()
      ),
      GoRoute(
          path: '/search',
        builder: (context, state) => const SearchScreen()
      ),
      GoRoute(
          path: '/favorite',
          builder: (context, state) => const FavoriteScreen()
      ),
    ]
  );
});