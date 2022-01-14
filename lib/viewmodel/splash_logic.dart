import 'package:flutter/cupertino.dart';
import 'package:free_chat_app/ui/views/login_screen.dart';

Future handleSplashLogic(ctx) async {
  Future.delayed(const Duration(seconds: 3), () async {
    Navigator.of(ctx).push(
      CupertinoPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  });
}
