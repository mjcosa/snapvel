import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isSent;
  final bool showTimeCenter;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.time,
    required this.isSent,
    this.showTimeCenter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (showTimeCenter)
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Text(
              time,
              style: const TextStyle(
                color: Color(0xFFABABAB),
                fontSize: 12,
                fontFamily: 'Sen',
                letterSpacing: -0.33,
              ),
            ),
          )
        else
          Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              left: isSent ? 0 : 45.0,
            ),
            child: Text(
              time,
              style: const TextStyle(
                color: Color(0xFFABABAB),
                fontSize: 12,
                fontFamily: 'Sen',
                letterSpacing: -0.33,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 13.0,
              vertical: 17.0,
            ),
            decoration: BoxDecoration(
              color: isSent
                  ? const Color(0xFFFF7622)
                  : const Color(0xFFF0F5FA),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: isSent
                    ? Colors.white
                    : const Color(0xFF32343E),
                fontSize: 14,
                fontFamily: 'Sen',
              ),
              textAlign: isSent ? TextAlign.right : TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}