
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:library_project/auth/login.dart';
import 'package:library_project/services/slap_screen.dart';
import 'firebase_options.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
      // title: "My App",
      // debugShowCheckedModeBanner: false,
      // color: Colors.black,
      // initialRoute: '/',
      // routes: {
      //   '/': (context)=> const MySlapScreen(),
      //   '/Login':(context)=> const MyLogin()
      // },
 home:MyLogin(),
    );
  }
}
