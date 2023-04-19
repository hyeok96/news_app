import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/newsHome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.nunitoSansTextTheme(
        const TextTheme(),
      )),
      home: NewsHomeScreen(),
    );
  }
}
