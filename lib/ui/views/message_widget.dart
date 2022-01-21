import 'package:flutter/material.dart';
import 'package:free_chat_app/data/message.dart';
import 'package:free_chat_app/ui/shared/app_colors.dart';
import 'package:free_chat_app/ui/widgets/app_buttons.dart';
import 'package:free_chat_app/ui/widgets/continue_chat.dart';
import 'package:free_chat_app/ui/widgets/take_actions.dart';
import 'package:intl/intl.dart';

class MessageWidget extends StatelessWidget {
  // final String message;
  // final DateTime date;
  // final String? email;
  final Message message;
  final bool isMe;

  const MessageWidget({
    Key? key,
    required this.message,
    this.isMe = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 1,
        top: 5,
        right: 1,
        bottom: 2,
      ),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (message.email != null) ...[
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                message.email!,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(4),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(4),
              ),
              color: isMe ? chatColor : const Color(0XFFE9EAEE),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                top: 8.0,
                bottom: 8,
              ),
              child: Text(
                message.text,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              DateFormat('kk:mma').format(message.date).toString(),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
          ),
          if (!isMe && message.flagged!) ...[
            Container(
              color: Colors.white,
              height: 180,
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "Note: You are being bullied!!",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Sir Alex uses inappropriate word \"${message.text}\" in this conversation with you I pressume \"${message.email}\"  to be a bully",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppButtons(
                            text: 'Take Action',
                            color: Colors.white,
                            size: 20,
                            height: 48,
                            backgroundColor: primaryColor,
                            borderColor: primaryColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const TakeActionScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: AppButtons(
                            text: 'Continue',
                            color: primaryColor,
                            size: 20,
                            height: 48,
                            backgroundColor: Colors.white,
                            borderColor: primaryColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ContinueChat(
                                    message: message,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ],
      ),
    );
  }
}
