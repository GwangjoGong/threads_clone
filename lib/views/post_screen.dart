import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/views/camera_screen.dart';
import 'package:threads_clone/utils.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  String _imagePath = "";

  String _text = "";

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _text = _textEditingController.text;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> onTapFile() async {
    final String imagePath = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const CameraScreen();
        },
      ),
    );

    setState(() {
      _imagePath = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isPostEnabled = _text.isNotEmpty;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 48,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: isDarkMode(context)
                  ? Colors.grey.shade700
                  : Colors.grey.shade200,
              height: 1,
            ),
          ),
          title: const Text(
            "New thread",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: isDarkMode(context) ? Colors.black : Colors.white,
          elevation: 0,
          leadingWidth: 80,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cancel",
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                "https://picsum.photos/seed/1/600",
                              ),
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minHeight: 50,
                                ),
                                child: const VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Opacity(
                              opacity: 0.5,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundImage: NetworkImage(
                                  "https://picsum.photos/seed/2/600",
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "jane_mobbin",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                transform: Matrix4.translationValues(0, -8, 0),
                                child: TextField(
                                  controller: _textEditingController,
                                  minLines: 1,
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    hintText: "Start a thread...",
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              if (_imagePath.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(_imagePath),
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              if (_imagePath.isEmpty)
                                IconButton(
                                  splashRadius: 15,
                                  onPressed: onTapFile,
                                  icon: const FaIcon(
                                    FontAwesomeIcons.paperclip,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: BottomAppBar(
                elevation: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Anyone can reply",
                        style: TextStyle(color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (isPostEnabled) {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                          "Post",
                          style: TextStyle(
                            color: isPostEnabled
                                ? Colors.blue
                                : Colors.blue.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
