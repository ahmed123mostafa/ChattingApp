import 'package:chatapp/models/model.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({required this.message, Key? key}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 10, bottom: 15, top: 15, right: 10),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            )),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white, fontFamily: "Pacifico"),
        ),
      ),
    );
  }
}

class ChatBubbleforafriend extends StatelessWidget {
  const ChatBubbleforafriend({required this.message, Key? key})
      : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
            const EdgeInsets.only(left: 10, bottom: 15, top: 15, right: 10),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: const BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            )),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white, fontFamily: "Pacifico"),
        ),
      ),
    );
  }
}
