import 'package:flutter/material.dart';
import 'package:marketa_new/helpers/color/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    splashController();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void splashController() async {
    await Future.delayed(Duration(seconds: 6));
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      bottomNavigationBar: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Copyright @Unzip Software Solutions",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: secondaryColor3,
                    fontSize: 8,
                  ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Marketa",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "Where Ghana shops!",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: secondaryColor3,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
