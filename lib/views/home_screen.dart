import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/views/widgets/post.dart';
import 'package:threads_clone/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: FaIcon(
          FontAwesomeIcons.threads,
          color: isDarkMode(context) ? Colors.white : Colors.black,
          size: 32,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Post(),
            Post(),
            Post(),
          ],
        ),
      ),
    );
  }
}
