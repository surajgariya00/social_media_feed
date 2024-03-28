import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_feed/Screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: 'AIzaSyC00gbeRr1tWSLf_RnI-MsBVVS1HU49mic',
          appId: '1:1039799013129:web:6fab51512c10f7e9670dd8',
          messagingSenderId: '1039799013129',
          projectId: 'socialmedia-feed-26324',
        ))
      : await Firebase.initializeApp();

  runApp(const SocialMediaFeedApp());
}

class SocialMediaFeedApp extends StatelessWidget {
  const SocialMediaFeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Media Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const LoginScreen(),
    );
  }
}
