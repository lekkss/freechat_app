import 'package:flutter/material.dart';
import 'package:free_chat_app/data/message.dart';
import 'package:free_chat_app/ui/shared/app_colors.dart';
import 'package:free_chat_app/ui/widgets/app_buttons.dart';

class ContinueChat extends StatefulWidget {
  final Message message;
  const ContinueChat({Key? key, required this.message}) : super(key: key);

  @override
  _ContinueChatState createState() => _ContinueChatState();
}

class _ContinueChatState extends State<ContinueChat> {
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
              "Do you want to continue with the chat?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "We won't reveal any actions you take to the user.\nYour secret is safe with us",
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                const Text("I'm fine with it"),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                const Text("We're playing"),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                const Text("I'm conscious and aware of it"),
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
              text: 'Continue',
              onPressed: () {
                widget.message.reference!.update({
                  "flagged": false,
                });
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
