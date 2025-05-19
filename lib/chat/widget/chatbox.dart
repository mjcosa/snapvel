import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 158.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 60.0,
        vertical: 24.0,
      ),
      width: 327,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F5FA),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: const Text(
        'Write something',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFABABAB),
          fontSize: 12,
          fontFamily: 'Sen',
          letterSpacing: -0.33,
        ),
      ),
    );
  }
}