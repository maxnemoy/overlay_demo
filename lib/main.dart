import 'package:flutter/material.dart';
import 'package:overlay_demo/fcm.dart';
import 'package:overlay_demo/overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FcmService.initFCM();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late OverlayService overlay;
 
  @override
  void initState() {
    overlay = OverlayService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  overlay.requestPermissions();
                },
                child: const Text("request permission")),
            ElevatedButton(
              onPressed: () {
                overlay.showOverlayWindow("title", "message");
              },
              child: const Text("show"),
            ),
          ],
        ),
      ),
    );
  }
}
