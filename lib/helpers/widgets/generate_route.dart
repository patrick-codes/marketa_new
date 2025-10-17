import 'package:flutter/material.dart';
import 'package:marketa_new/presentation/notification/pages/notifications.dart';
import 'package:marketa_new/presentation/settings/pages/general/language_settings.dart';
import '../../presentation/ai/chatbot.dart';
import '../../presentation/authentication/pages/login_screen.dart';
import '../../presentation/authentication/pages/otp_screen.dart';
import '../../presentation/authentication/pages/password_reset_screen.dart';
import '../../presentation/authentication/pages/register_screen.dart';
import '../../presentation/cart/pages/cart_page.dart';
import '../../presentation/cart/pages/cart_page_new.dart';
import '../../presentation/checkout/pages/add_card.dart';
import '../../presentation/checkout/pages/checkout.dart';
import '../../presentation/home/pages/home.dart';
import '../../presentation/home/pages/main_home.dart';
import '../../presentation/intro/pages/onboarding/pages/onboarding_screen.dart';
import '../../presentation/intro/pages/splash_screen.dart';
import '../../presentation/intro/pages/welcome_screen.dart';
import '../../presentation/search/main_search_page.dart';
import '../../presentation/search/search_page.dart';
import '../../presentation/settings/pages/general/notification_settings.dart';
import '../../presentation/settings/pages/general/security_settings.dart';
import '../../presentation/settings/pages/general/themes_settings.dart';
import '../../presentation/settings/pages/preferences/help_support.dart';
import '../../presentation/settings/pages/preferences/legal_policies.dart';
import '../../presentation/products/pages/shop_details_page.dart';
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
      final args = settings.arguments as Map<String, dynamic>;
      return slideFromRight(ShopDetailsPage(
        id: args['id'],
      ));

    case '/cartnew':
      return slideFromRight(CartPageNew());

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

    case '/themes':
      return slideFromRight(ThemesPage());

    case '/passwordsettings':
      return slideFromRight(PassSettingsPage());

    case '/notificationsettings':
      return slideFromRight(NotifSettingsPage());

    case '/security':
      return slideFromRight(SecurityPage());

    case '/languages':
      return slideFromRight(LanguageSettings());

    case '/legal':
      return slideFromRight(LegalPolicyPage());

    case '/support':
      return slideFromRight(SupportPage());

    default:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );
  }
}
