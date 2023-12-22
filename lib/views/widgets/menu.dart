import 'package:flutter/material.dart';
import 'package:threads_clone/utils.dart';

enum MenuState { initial, report }

class Menu extends StatefulWidget {
  const Menu({
    super.key,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  MenuState _menuState = MenuState.initial;

  void _onTapReport(BuildContext context) {
    setState(() {
      _menuState = MenuState.report;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _menuState == MenuState.initial
        ? InitialScreen(onTapReport: _onTapReport)
        : const ReportScreen();
  }
}

class InitialScreen extends StatelessWidget {
  final Function(BuildContext) onTapReport;

  const InitialScreen({super.key, required this.onTapReport});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isDarkMode(context)
                  ? Colors.grey.shade800
                  : const Color(0xfff5f5f5),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border(
                bottom: BorderSide(
                  color: isDarkMode(context)
                      ? Colors.grey.shade700
                      : Colors.grey.shade200,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: const Row(
              children: [
                Text(
                  "Unfollow",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isDarkMode(context)
                  ? Colors.grey.shade800
                  : const Color(0xfff5f5f5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: const Row(
              children: [
                Text(
                  "Mute",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: isDarkMode(context)
                  ? Colors.grey.shade800
                  : const Color(0xfff5f5f5),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border(
                bottom: BorderSide(
                  color: isDarkMode(context)
                      ? Colors.grey.shade700
                      : Colors.grey.shade200,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: const Row(
              children: [
                Text(
                  "Hide",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => onTapReport(context),
            child: Container(
              decoration: BoxDecoration(
                color: isDarkMode(context)
                    ? Colors.grey.shade800
                    : const Color(0xfff5f5f5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: const Row(
                children: [
                  Text(
                    "Report",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDarkMode(context) ? Colors.grey.shade900 : Colors.white,
      appBar: AppBar(
        //border bottom
        toolbarHeight: 48,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(
            height: 1,
            thickness: 1,
            color: isDarkMode(context)
                ? Colors.grey.shade700
                : Colors.grey.shade200,
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "Report",
          style: TextStyle(
            color: isDarkMode(context) ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor:
            isDarkMode(context) ? Colors.grey.shade900 : Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isDarkMode(context)
                          ? Colors.grey.shade700
                          : Colors.grey.shade200,
                    ),
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Why are you reporting this thread?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () {},
                shape: Border(
                  bottom: BorderSide(
                    color: isDarkMode(context)
                        ? Colors.grey.shade700
                        : Colors.grey.shade200,
                  ),
                ),
                title: const Text(
                  "I just don't like it",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ),
              ListTile(
                onTap: () {},
                shape: Border(
                  bottom: BorderSide(
                    color: isDarkMode(context)
                        ? Colors.grey.shade700
                        : Colors.grey.shade200,
                  ),
                ),
                title: const Text(
                  "It's unlawful content under NetzDG",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ),
              ListTile(
                onTap: () {},
                shape: Border(
                  bottom: BorderSide(
                    color: isDarkMode(context)
                        ? Colors.grey.shade700
                        : Colors.grey.shade200,
                  ),
                ),
                title: const Text(
                  "It's spam",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ),
              ListTile(
                onTap: () {},
                shape: Border(
                  bottom: BorderSide(
                    color: isDarkMode(context)
                        ? Colors.grey.shade700
                        : Colors.grey.shade200,
                  ),
                ),
                title: const Text(
                  "Hate speech or symbols",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ),
              ListTile(
                onTap: () {},
                shape: Border(
                  bottom: BorderSide(
                    color: isDarkMode(context)
                        ? Colors.grey.shade700
                        : Colors.grey.shade200,
                  ),
                ),
                title: const Text(
                  "Nudity or sexual activity",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
