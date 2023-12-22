import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  late CameraController _cameraController;

  bool _isSelfie = false;
  bool _permissionGranted = false;

  bool _isTaking = false;

  @override
  void initState() {
    super.initState();
    _initPermissions();
  }

  Future<void> _initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final microphonePermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final microphoneDenied = microphonePermission.isDenied ||
        microphonePermission.isPermanentlyDenied;

    if (!cameraDenied && !microphoneDenied) {
      await _initCamera();
      setState(() {
        _permissionGranted = true;
      });
    }
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      final camera = cameras[_isSelfie ? 1 : 0];
      _cameraController = CameraController(camera, ResolutionPreset.max);
      await _cameraController.initialize();
      await _cameraController.prepareForVideoRecording();
    }
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfie = !_isSelfie;
    await _initCamera();
    setState(() {});
  }

  @override
  void dispose() {
    _cameraController.dispose();

    super.dispose();
  }

  Future<void> _onTap() async {
    if (_cameraController.value.isTakingPicture) return;

    setState(() {
      _isTaking = true;
    });

    final picture = await _cameraController.takePicture();

    if (!mounted) return;

    Navigator.pop(context, picture.path);
  }

  Future<void> _onTapLibrary() async {
    final imagePicker = ImagePicker();

    final image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image == null) return;
    if (!mounted) return;

    Navigator.pop(context, image.path);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (!_cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff191814),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xff191814),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(42),
                  bottomRight: Radius.circular(42),
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (_permissionGranted &&
                      _cameraController.value.isInitialized)
                    CameraPreview(_cameraController),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: 0,
                    child: Container(
                      height: 120,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black54,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const FaIcon(
                              Icons.flash_off,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: _onTap,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircularProgressIndicator(
                                    value: _isTaking ? null : 1,
                                    color: Colors.white,
                                    backgroundColor: Colors.white24,
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: _toggleSelfieMode,
                            icon: const FaIcon(
                              Icons.cameraswitch,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: const Text(
                      "Camera",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: _onTapLibrary,
                    style: ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Text(
                      "Library",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
