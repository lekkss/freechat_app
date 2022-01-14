import 'package:flutter/material.dart';
import 'package:free_chat_app/ui/widgets/app_large_text.dart';
import 'package:free_chat_app/viewmodel/splash_logic.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    handleSplashLogic(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Image.asset("images/splash_image.png"),
          ),
          const Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: AppLargeText(text: 'FREE CHAT'),
            ),
          ),
        ],
      ),
    );
  }
}
