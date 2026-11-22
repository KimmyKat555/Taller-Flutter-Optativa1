import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/screens/home_screen.dart';
import '../features/screens/age_screen.dart';
import '../features/screens/bmi_screen.dart';
import '../features/screens/zodiac_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '/age',
        builder: (BuildContext context, GoRouterState state) {
          return const AgeScreen();
        },
      ),
      GoRoute(
        path: '/bmi',
        builder: (BuildContext context, GoRouterState state) {
          return const BmiScreen();
        },
      ),
      GoRoute(
        path: '/zodiac',
        builder: (BuildContext context, GoRouterState state) {
          return const ZodiacScreen();
        },
      ),
    ],
  );
}