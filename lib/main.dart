import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oru_phones_assignment/firebase_options.dart';
import 'package:oru_phones_assignment/screens/home_page.dart';
import 'package:oru_phones_assignment/utils/firebase_api.dart';

final navigateKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final FirebaseMessagingHandler _firebaseMessagingHandler = FirebaseMessagingHandler();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _firebaseMessagingHandler.initialize(navigatorKey);
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
