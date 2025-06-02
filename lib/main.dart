import 'package:flutter/material.dart';
import 'package:marketa_new/presentation/authentication/pages/login_screen.dart';
import 'package:marketa_new/presentation/home/main_home.dart';
import 'package:marketa_new/presentation/intro/onboarding/onboarding_screen.dart';
import 'package:marketa_new/presentation/search/main_search_page.dart';
import 'package:marketa_new/presentation/search/search_page.dart';
import 'helpers/color/colors.dart';
import 'presentation/authentication/pages/otp_screen.dart';
import 'presentation/authentication/pages/register_screen.dart';
import 'presentation/home/home.dart';
import 'presentation/intro/pages/welcome_screen.dart';
import 'presentation/intro/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hairvana',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/login': (context) => const LoginScreen(),
        '/otp': (context) => const OtpScreen(),
        '/mainhome': (context) => const MainHomePage(),
        '/home': (context) => const MyHomePage(),
        '/search': (context) => const SearchPage(),
        '/mainsearch': (context) => const MainSearchPage(),
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/mainshopinfo') {
      //     final args = settings.arguments as Map<String, dynamic>;
      //     return MaterialPageRoute(
      //       builder: (context) => MainShopinfoPage(id: args['id']),
      //     );
      //   }
      //   return null;
      // },
      theme: ThemeData(
        fontFamily: 'Poppins',
        // textTheme: GoogleFonts.interTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        scaffoldBackgroundColor: secondaryBg,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // home: SplashScreen(),
    );
  }
}
