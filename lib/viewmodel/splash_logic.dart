import 'package:flutter/cupertino.dart';
import 'package:free_chat_app/data/user_dao.dart';
import 'package:free_chat_app/ui/views/login_screen.dart';
import 'package:free_chat_app/ui/views/message_list.dart';
import 'package:provider/provider.dart';

Future handleSplashLogic(ctx) async {
  Future.delayed(const Duration(seconds: 7), () async {
    Navigator.of(ctx).push(
      CupertinoPageRoute(
        builder: (context) => Consumer<UserDao>(
          builder: (context, userDao, child) {
            if (userDao.isLoggedIn()) {
              return const MessageList();
            } else {
              return const LoginScreen();
            }
          },
        ),
      ),
    );
  });
}
