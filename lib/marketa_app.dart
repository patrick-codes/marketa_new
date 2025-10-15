import 'package:flutter/material.dart';
import 'package:marketa_new/presentation/intro/pages/splash_screen.dart';
import 'package:toastification/toastification.dart';
import 'helpers/color/colors.dart';
import 'helpers/widgets/generate_route.dart';

class MarketaApp extends StatelessWidget {
  const MarketaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
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
      ),
    );
  }
}
