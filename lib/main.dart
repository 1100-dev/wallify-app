// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import 'firebase_options.dart';
// import 'navigation/bottom_nav.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   runApp(const WallifyApp());
// }
//
// class WallifyApp extends StatelessWidget {
//   const WallifyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//
//       theme: ThemeData.light().copyWith(
//         scaffoldBackgroundColor: Colors.white,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           elevation: 0,
//         ),
//       ),
//
//       darkTheme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: const Color(0xFF0F0F0F),
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.black,
//           foregroundColor: Colors.white,
//           elevation: 0,
//         ),
//       ),
//
//       themeMode: ThemeMode.system,
//
//       home: const BottomNav(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import '../../screens/splash/splash_screen.dart';
// import 'navigation/bottom_nav.dart';
import '../../core/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(WallifyApp());
}

class WallifyApp extends StatelessWidget {
  WallifyApp({super.key});

  static final ThemeController themeController =
  ThemeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          //--------------------------------
          // LIGHT THEME
          //--------------------------------
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor:
            const Color(0xFFF7F8FC),

            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
            ),
          ),

          //--------------------------------
          // DARK THEME
          //--------------------------------
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor:
            const Color(0xFF121212),

            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1E1E1E),
              foregroundColor: Colors.white,
              elevation: 0,
            ),
          ),

          //--------------------------------
          // CONTROLLED THEME
          //--------------------------------
          themeMode:
          themeController.themeMode,

          // home: const BottomNav(),
          home: const SplashPage(),
        );
      },
    );
  }
}