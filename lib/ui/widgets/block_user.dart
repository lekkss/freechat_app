import 'package:flutter/material.dart';
import 'package:free_chat_app/data/message.dart';
import 'package:free_chat_app/ui/shared/app_colors.dart';
import 'package:free_chat_app/ui/views/message_list.dart';

import 'app_buttons.dart';

class BlockUserScreeen extends StatefulWidget {
  final Message message;
  const BlockUserScreeen({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  _BlockUserScreeenState createState() => _BlockUserScreeenState();
}

class _BlockUserScreeenState extends State<BlockUserScreeen> {
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
                  Text(
                    "Block ${widget.message.email}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Blocked contack will no longer\nbe able to send you messages",
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      const Text(
                        "Delete previous chat with this user",
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
                    text: 'Block User',
                    onPressed: () {
                      widget.message.reference!.update({
                        "flagged": false,
                      });
                      widget.message.reference!.delete();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => MessageList(
                            isBlocked: true,
                          ),
                        ),
                      );
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
