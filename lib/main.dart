import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:threads_clone/repos/dark_mode_config_repo.dart';
import 'package:threads_clone/router.dart';
import 'package:threads_clone/view_models/dark_mode_config_view_model.dart';

void main() async {
  GoRouter.optionURLReflectsImperativeAPIs = true;

  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();

  final DarkModeConfigRepository darkModeConfigRepository =
      DarkModeConfigRepository(
    sharedPreferences: preferences,
  );

  runApp(
    ProviderScope(
      overrides: [
        darkModeProvider.overrideWith(
          () => DarkModeConfigViewModel(repository: darkModeConfigRepository),
        ),
      ],
      child: const ThreadsClone(),
    ),
  );
}

class ThreadsClone extends ConsumerWidget {
  const ThreadsClone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Threads Clone',
      themeMode: ref.watch(darkModeProvider).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: false,
        brightness: Brightness.dark,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black,
        ),
      ),
      routerConfig: router,
    );
  }
}
