import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:threads_clone/views/activity_screen.dart';
import 'package:threads_clone/views/home_screen.dart';
import 'package:threads_clone/views/main_navigation_screen.dart';
import 'package:threads_clone/views/post_screen.dart';
import 'package:threads_clone/views/privacy_screen.dart';
import 'package:threads_clone/views/profile_screen.dart';
import 'package:threads_clone/views/search_screen.dart';
import 'package:threads_clone/views/settings_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainNavigationScreen(
          currentPath: state.fullPath ?? "/",
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/activity',
          builder: (context, state) => const ActivityScreen(),
        ),
        GoRoute(
          path: '/post',
          builder: (context, state) => const PostScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/settings',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SettingsScreen(),
      routes: [
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: 'privacy',
          builder: (context, state) => const PrivacyScreen(),
        ),
      ],
    ),
  ],
);
