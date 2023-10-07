import 'package:flutter/material.dart';
import 'package:to_do/Screens/display_todo.dart';
import 'package:to_do/Screens/login_screen.dart';
import 'package:to_do/Screens/new_todo.dart';
import 'Screens/welcome_screen.dart';

var kcolorscheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 99, 125),
    brightness: Brightness.dark);

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      cardTheme: const CardTheme().copyWith(
        color: kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
        ),

      )
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kcolorscheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: Colors.deepPurple,
        foregroundColor:Colors.white
      ),
      cardTheme: const CardTheme().copyWith(
        color: Colors.deepPurple,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      
      textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color: kcolorscheme.onPrimaryContainer,
              fontSize: 14)),
    ),
    home: const WelocmeScreen(),
  ));
}
