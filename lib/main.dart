import 'package:flutter/material.dart';
import 'package:overlay_demo/fcm.dart';

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

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("hello")),
    );
  }
}
