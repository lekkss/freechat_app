import 'package:flutter/material.dart';
import 'package:free_chat_app/ui/views/splash_screen.dart';

import 'data/user_dao.dart';
// import 'ui/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../data/message_dao.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider<UserDao> here

        ChangeNotifierProvider<UserDao>(
          lazy: false,
          create: (_) => UserDao(),
        ),
        Provider<MessageDao>(
          lazy: false,
          create: (_) => MessageDao(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Avenir-Next-LT-Pro-Regular',
          primarySwatch: Colors.blue,
        ),
        home:
            // home: Consumer<UserDao>(
            //   builder: (context, userDao, child) {
            //     if (userDao.isLoggedIn()) {
            //       return const MessageList();
            //     } else {
            //       return const LoginScreen();
            //     }
            //   },
            // ),
            const SplashScreen(),
      ),
    );
  }
}
