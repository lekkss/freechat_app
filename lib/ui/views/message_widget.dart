import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final DateTime date;
  final String? email;

  const MessageWidget(
    this.message,
    this.date,
    this.email, {
    Key? key,
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
        children: [
          // if (email != null) ...[
          //   Padding(
          //     padding: const EdgeInsets.only(top: 4),
          //     child: Align(
          //       alignment: Alignment.topRight,
          //       child: Text(
          //         email!,
          //         style: const TextStyle(color: Colors.grey),
          //       ),
          //     ),
          //   ),
          // ],
          Align(
            alignment: Alignment.centerRight,
            child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(4),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(4),
                  ),
                  color: Color(0XFFE9EAEE),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 8.0,
                    bottom: 8,
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                DateFormat('kk:mma').format(date).toString(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
