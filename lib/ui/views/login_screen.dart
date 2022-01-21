import 'package:flutter/material.dart';
import 'package:free_chat_app/data/user_dao.dart';
import 'package:free_chat_app/ui/shared/app_colors.dart';
import 'package:free_chat_app/ui/widgets/app_buttons.dart';
import 'package:free_chat_app/ui/widgets/app_large_text.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var user = {};

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userDao = Provider.of<UserDao>(context, listen: false);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 88.0,
              right: 88,
              top: 70,
            ),
            child: AppLargeText(text: 'Welcome to Freechat'),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 28, right: 36.0, top: 48),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    onSaved: (value) {
                      user['phoneNumber'] = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter something';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: ' Email',
                      labelText: ' Email',
                      labelStyle: const TextStyle(
                        color: primaryColor,
                      ),
                      filled: true,
                      fillColor: const Color(0X3BDCDCDC),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0X3BDCDCDC),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    onSaved: (value) {
                      user['password'] = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter something';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        color: primaryColor,
                      ),
                      hintText: 'Password',
                      filled: true,
                      fillColor: const Color(0X3BDCDCDC),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0X3BDCDCDC),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 300,
                  ),
                  AppButtons(
                    color: Colors.white,
                    text: 'Continue',
                    size: 280,
                    height: 50,
                    backgroundColor: primaryColor,
                    borderColor: primaryColor,
                    onPressed: () {
                      userDao.login(
                          _emailController.text, _passwordController.text);
                      // if (_formKey.currentState!.validate()) {
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //       builder: (BuildContext context) =>
                      //           const ChatScreen(),
                      //     ),
                      //   );
                      // } else {
                      //   debugPrint("not ok");
                      // }
                    },
                  ),
                  const SizedBox(height: 20),
                  AppButtons(
                    color: Colors.white,
                    text: 'Signup',
                    size: 280,
                    height: 50,
                    backgroundColor: primaryColor,
                    borderColor: primaryColor,
                    onPressed: () {
                      userDao.signup(
                          _emailController.text, _passwordController.text);
                      // if (_formKey.currentState!.validate()) {
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //       builder: (BuildContext context) =>
                      //           const ChatScreen(),
                      //     ),
                      //   );
                      // } else {
                      //   debugPrint("not ok");
                      // }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
