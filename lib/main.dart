import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:meals_app/screens/categories_screen.dart';

final kColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 136, 93, 255),
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: kColorScheme,
        textTheme: GoogleFonts.latoTextTheme(),
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onSecondary,
          foregroundColor: kColorScheme.onSurface,
        ),
      ),
      home: const CategoriesScreen(),
    );
  }
}
