import 'package:flutter/material.dart';
import 'package:marketa_new/helpers/widgets/generate_route.dart';
import 'helpers/color/colors.dart';
import 'presentation/intro/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marketa',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
      },
      onGenerateRoute: generateRoute,
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
    );
  }
}
