import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shine/screens/auth.dart';
import 'package:shine/screens/shine.dart';
import 'package:shine/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shine/screens/splash.dart';
var darkcolorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 220, 173 , 5));
var colorScheme= ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 116, 220));
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
        scaffoldBackgroundColor: darkcolorScheme.onSurface,
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
            backgroundColor: darkcolorScheme.onSurface,
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
     home: StreamBuilder(
       stream: FirebaseAuth.instance.authStateChanges(),
       builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const SplashScreen();
        }
        if(snapshot.hasData){
          return const Shine();
        }
         return const AuthScreen();
       }
     ),
    ),
  );
}
