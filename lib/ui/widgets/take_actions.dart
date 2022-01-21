import 'package:flutter/material.dart';
import 'package:free_chat_app/ui/shared/app_colors.dart';

import 'app_buttons.dart';

class TakeActionScreen extends StatefulWidget {
  const TakeActionScreen({Key? key}) : super(key: key);

  @override
  _TakeActionScreenState createState() => _TakeActionScreenState();
}

class _TakeActionScreenState extends State<TakeActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Actions you can take",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "We won't reveal any actions you take to the user.\nYour secret is safe with us",
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Report this user?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Last 5 messages from this user will be sent\nTo FreeChat for security purposes",
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      const Text(
                        "Save chat with this user",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AppButtons(
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width,
                    height: 45,
                    backgroundColor: primaryColor,
                    borderColor: primaryColor,
                    text: 'Report User',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
