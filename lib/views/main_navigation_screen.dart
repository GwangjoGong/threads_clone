import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/router.dart';
import 'package:threads_clone/views/post_screen.dart';
import 'package:threads_clone/utils.dart';

class MainNavigationScreen extends StatefulWidget {
  final Widget child;
  final String currentPath;

  const MainNavigationScreen({
    super.key,
    required this.child,
    required this.currentPath,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  void _onTap(String href) {
    router.go(href);
  }

  void _onTapPost() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      builder: (context) {
        return const PostScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: isDarkMode(context)
                    ? Colors.grey.shade800
                    : Colors.grey.shade200,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavTab(
                icon: FontAwesomeIcons.house,
                onTap: () => _onTap("/"),
                isSelected: widget.currentPath == "/",
              ),
              NavTab(
                icon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => _onTap("/search"),
                isSelected: widget.currentPath == "/search",
              ),
              NavTab(
                icon: FontAwesomeIcons.squarePlus,
                onTap: _onTapPost,
                isSelected: false,
              ),
              NavTab(
                icon: FontAwesomeIcons.heart,
                onTap: () => _onTap("/activity"),
                isSelected: widget.currentPath == "/activity",
              ),
              NavTab(
                icon: FontAwesomeIcons.user,
                onTap: () => _onTap("/profile"),
                isSelected: widget.currentPath == "/profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavTab extends StatefulWidget {
  final IconData icon;
  final Function() onTap;
  final bool isSelected;

  const NavTab({
    super.key,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  @override
  State<NavTab> createState() => _NavTabState();
}

class _NavTabState extends State<NavTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onTap,
      child: FaIcon(
        widget.icon,
        color: widget.isSelected
            ? isDarkMode(context)
                ? Colors.white
                : Colors.black
            : isDarkMode(context)
                ? Colors.grey.shade800
                : Colors.grey,
      ),
    );
  }
}
