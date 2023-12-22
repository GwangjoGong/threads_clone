import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads_clone/router.dart';
import 'package:threads_clone/utils.dart';
import 'package:threads_clone/view_models/dark_mode_config_view_model.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode(context) ? Colors.black : Colors.white,
        foregroundColor: isDarkMode(context) ? Colors.white : Colors.black,
        elevation: 0.2,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text(
              "Follow and invite friends",
            ),
            leading: Icon(
              Icons.person_add_alt_1_outlined,
            ),
            horizontalTitleGap: 0,
          ),
          const ListTile(
            title: Text(
              "Notifications",
              style: TextStyle(),
            ),
            leading: Icon(
              Icons.notifications_outlined,
            ),
            horizontalTitleGap: 0,
          ),
          SwitchListTile.adaptive(
            value: ref.watch(darkModeProvider).isDarkMode,
            onChanged: (value) {
              ref.read(darkModeProvider.notifier).toggleDarkMode();
            },
            title: const Row(
              children: [
                Icon(Icons.dark_mode_outlined),
                SizedBox(
                  width: 16,
                ),
                Text("Dark Mode"),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              router.push("/settings/privacy");
            },
            title: const Text(
              "Privacy",
              style: TextStyle(),
            ),
            leading: const Icon(
              Icons.lock_outline,
            ),
            horizontalTitleGap: 0,
          ),
          const ListTile(
            title: Text(
              "Account",
              style: TextStyle(),
            ),
            leading: Icon(
              Icons.person_outline,
            ),
            horizontalTitleGap: 0,
          ),
          const ListTile(
            title: Text(
              "Help",
              style: TextStyle(),
            ),
            leading: Icon(
              Icons.heat_pump_outlined,
            ),
            horizontalTitleGap: 0,
          ),
          ListTile(
            onTap: () {
              showAboutDialog(context: context);
            },
            title: const Text(
              "About",
              style: TextStyle(),
            ),
            leading: const Icon(
              Icons.info_outline,
            ),
            horizontalTitleGap: 0,
          ),
          const Divider(
            height: 0,
            thickness: 0.5,
          ),
          ListTile(
            onTap: () {
              showAdaptiveDialog(
                context: context,
                builder: (context) => AlertDialog.adaptive(
                  title: const Text("Log out"),
                  content: const Text("Are you sure you want to log out?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Log out"),
                    ),
                  ],
                ),
              );
            },
            title: const Text(
              "Log out",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
