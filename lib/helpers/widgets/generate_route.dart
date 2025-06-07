import 'package:flutter/material.dart';
import 'package:marketa_new/presentation/notification/pages/notifications.dart';
import '../../presentation/ai/chatbot.dart';
import '../../presentation/authentication/pages/login_screen.dart';
import '../../presentation/authentication/pages/otp_screen.dart';
import '../../presentation/authentication/pages/register_screen.dart';
import '../../presentation/cart/pages/cart_page.dart';
import '../../presentation/checkout/pages/add_card.dart';
import '../../presentation/checkout/pages/checkout.dart';
import '../../presentation/home/pages/home.dart';
import '../../presentation/home/pages/main_home.dart';
import '../../presentation/intro/pages/onboarding/pages/onboarding_screen.dart';
import '../../presentation/intro/pages/splash_screen.dart';
import '../../presentation/intro/pages/welcome_screen.dart';
import '../../presentation/search/main_search_page.dart';
import '../../presentation/search/search_page.dart';
import '../../presentation/store/pages/shop_details_page.dart';
import '../../presentation/store/pages/shop_home.dart';
import '../../presentation/tracking/pages/order_tracking_page.dart';
import 'route_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/welcome':
      return slideFromRight(const WelcomeScreen());

    case '/onboarding':
      return slideFromRight(const OnboardingScreen());

    case '/signup':
      return slideFromRight(const SignUpScreen());

    case '/login':
      return slideFromRight(const LoginScreen());

    case '/otp':
      return slideFromRight(const OtpScreen());

    case '/mainhome':
      return slideFromRight(const MainHomePage());

    case '/home':
      return slideFromRight(const MyHomePage());

    case '/search':
      return slideFromRight(const SearchPage());

    case '/mainsearch':
      return slideFromRight(const MainSearchPage());

    case '/mainshop':
      return slideFromRight(const MainShopHome());

    case '/shopdetails':
      return slideFromRight(ShopDetailsPage());

    case '/cart':
      return slideFromRight(CartPage());

    case '/checkout':
      return slideFromRight(CheckOutPage());

    case '/addcard':
      return slideFromRight(AddCardPage());

    case '/notification':
      return slideFromRight(NotificationPage());

    case '/tracking':
      return slideFromRight(OrderTrackingPage());

    case '/chatbot':
      return slideFromRight(ChatbotScreen());

    default:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );
  }
}
