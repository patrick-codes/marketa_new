import 'package:flutter/material.dart';
import 'package:marketa_new/presentation/authentication/pages/login_screen.dart';
import 'package:marketa_new/presentation/home/pages/main_home.dart';
import 'package:marketa_new/presentation/intro/pages/onboarding/pages/onboarding_screen.dart';
import 'package:marketa_new/presentation/search/main_search_page.dart';
import 'package:marketa_new/presentation/search/search_page.dart';
import 'package:marketa_new/presentation/store/pages/shop_details_page.dart';
import 'package:marketa_new/presentation/store/pages/shop_home.dart';
import 'helpers/color/colors.dart';
import 'presentation/authentication/pages/otp_screen.dart';
import 'presentation/authentication/pages/register_screen.dart';
import 'presentation/home/pages/home.dart';
import 'presentation/intro/pages/splash_screen.dart';
import 'presentation/intro/pages/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/mainshop': (context) => const MainShopHome(),
        '/shopdetails': (context) => const ShopDetailsPage(),
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
        scaffoldBackgroundColor: secondaryBg,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // home: SplashScreen(),
    );
  }
}
