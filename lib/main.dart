import 'package:silkworm/screens/home_screen.dart';
import 'package:silkworm/screens/info.dart';
import 'package:silkworm/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:silkworm/screens/monitoring.dart';
import 'package:silkworm/screens/profile_screen.dart';
import 'package:silkworm/screens/signup_screen.dart';

import 'package:flutter/material.dart';
import 'package:silkworm/screens/forgot_password_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyCXXXu0rrMVoaEkWwR0o837uVKhmEuuu3s",
      appId: "1:510739274007:android:ac3d1ec76cd8b1e6363f52",
      messagingSenderId: "510739274007",
      projectId: "silkworm-disease-detection-app",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth Demo',
      theme: ThemeData(
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)))),
          appBarTheme: const AppBarTheme(
              color: Color.fromARGB(255, 1, 80, 4),
              foregroundColor: Colors.white),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color.fromARGB(255, 1, 80, 4),
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.amber),
          cardTheme: const CardTheme(
              elevation: 10, color: Color.fromARGB(255, 209, 240, 173)),
          elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green),
                  foregroundColor: MaterialStatePropertyAll(Colors.white)))),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/forgetPassword': (context) => const ForgetPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/info': (context) => SilkwormDiseasePage(),
        '/monitor': (context) => const Monitoring()
      },
    );
  }
}
