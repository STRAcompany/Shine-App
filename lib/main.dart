import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shine/screens/shine.dart';
import 'package:shine/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
var darkcolorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 220, 173 , 5));
var colorScheme= ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 116, 220));
var lightcolorScheme = const ColorScheme(
  brightness: Brightness.light, 
  primary: Color.fromARGB(255, 0, 115, 255), 
  onPrimary: Color.fromARGB(255, 93, 0, 199), 
  secondary: Color.fromARGB(255, 22, 228, 255), 
  onSecondary: Color.fromARGB(255, 255, 27, 179), 
  error: Color.fromARGB(255, 255, 51, 36), 
  onError: Color.fromARGB(255, 255, 0, 0), 
  background: Colors.white, 
  onBackground: Color.fromARGB(255, 18, 200, 255), 
  surface: Colors.lightGreen, 
  onSurface: Color.fromARGB(255, 239, 255, 8),
  );
List<Color> textColor =[Colors.grey,] ;
// var yellowColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 234, 255, 0));
// var blueColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 68, 171, 255));


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
     MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        textTheme: GoogleFonts.lailaTextTheme().copyWith(
          titleLarge: GoogleFonts.laila(
            color: darkcolorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 34,
            letterSpacing: 2,
          ),
          bodyMedium: GoogleFonts.laila(
            color: darkcolorScheme.primary,
            fontSize: 16,
            letterSpacing: 2,
          ),

        ),
        colorScheme: darkcolorScheme,
        scaffoldBackgroundColor: darkcolorScheme.onBackground,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: darkcolorScheme.onPrimaryContainer,
          foregroundColor: darkcolorScheme.primary,
          titleTextStyle: GoogleFonts.laila(
            fontSize: 22,
            color: darkcolorScheme.primary,
            fontWeight: FontWeight.w500),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: darkcolorScheme.primary,
            backgroundColor: darkcolorScheme.onBackground,
            textStyle: GoogleFonts.poppins().copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 8,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
     home: const Shine(),
    ),
  );
}
