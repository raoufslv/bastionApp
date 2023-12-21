import 'package:flutter/material.dart';
import 'package:bastonapp/widgets/custom_bottom_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';
import 'package:bastonapp/screens/home.dart';
import 'package:bastonapp/screens/gallerie.dart';
import 'package:bastonapp/screens/camera.dart';
import 'package:bastonapp/screens/qr_scan_ar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) async {
    if (value) {
      await Permission.notification.request();
    }
  });

  await Permission.scheduleExactAlarm.isDenied.then((value) async {
    if (value) {
      await Permission.scheduleExactAlarm.request();
    }
  });

  await Permission.camera.isDenied.then((value) async {
    if (value) {
      await Permission.camera.request();
    }
  });

  await Permission.accessMediaLocation.isDenied.then((value) async {
    if (value) {
      await Permission.accessMediaLocation.request();
    }
  });

  await Permission.manageExternalStorage.isDenied.then((value) async {
    if (value) {
      await Permission.manageExternalStorage.request();
    }
  });

  await Permission.storage.isDenied.then((value) async {
    if (value) {
      await Permission.storage.request();
    }
  });
  final cameras = await availableCameras();

  final firstCamera = cameras.first;
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.camera});
  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baston app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: MyHomePage(camera: camera),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.camera});

  final CameraDescription camera;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const Home(),
      const CombinedGallery(),
      Camera(camera: widget.camera),
      const QrScanAr(),
    ];
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
