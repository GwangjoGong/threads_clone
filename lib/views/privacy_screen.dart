import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/utils.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _private = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode(context) ? Colors.black : Colors.white,
        foregroundColor: isDarkMode(context) ? Colors.white : Colors.black,
        elevation: 0.2,
        title: const Text(
          "Privacy",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            activeColor: isDarkMode(context) ? Colors.blue : Colors.black,
            value: _private,
            onChanged: (value) {
              setState(() {
                _private = value;
              });
            },
            title: const Row(
              children: [
                Icon(
                  Icons.lock_outline,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Private profile",
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.alternate_email,
            ),
            horizontalTitleGap: 0,
            title: Text(
              "Mentions",
              style: TextStyle(),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Everyone",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                  size: 30,
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.notifications_off_outlined,
            ),
            horizontalTitleGap: 0,
            title: Text(
              "Muted",
              style: TextStyle(),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.grey,
              size: 30,
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.eyeSlash,
              size: 20,
            ),
            horizontalTitleGap: 0,
            title: Text(
              "Hidden Words",
              style: TextStyle(),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.grey,
              size: 30,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.people_outline,
            ),
            horizontalTitleGap: 0,
            title: Text(
              "Profiles you follow",
              style: TextStyle(),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.grey,
              size: 30,
            ),
          ),
          const Divider(
            height: 0,
            thickness: 0.5,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Other privacy settings",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.output_outlined,
                  color: Colors.grey,
                  size: 24,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.circleXmark,
            ),
            horizontalTitleGap: 0,
            title: Text(
              "Blocked profiles",
              style: TextStyle(),
            ),
            trailing: Icon(
              Icons.output_outlined,
              color: Colors.grey,
              size: 24,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.heart_broken_outlined,
            ),
            horizontalTitleGap: 0,
            title: Text(
              "Hide likes",
              style: TextStyle(),
            ),
            trailing: Icon(
              Icons.output_outlined,
              color: Colors.grey,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
