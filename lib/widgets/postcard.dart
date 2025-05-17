import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String avatarUrl;
  final String username;
  final String location;
  final String imageUrl;
  final String likes;
  final String comments;

  const PostCard({
    Key? key,
    required this.avatarUrl,
    required this.username,
    required this.location,
    required this.imageUrl,
    required this.likes,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                avatarUrl,
                width: 45,
                height: 45,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                      color: Color(0xFF1F214D),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Sen',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    location,
                    style: const TextStyle(
                      color: Color(0xFFA0A5BA),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Sen',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          Image.network(
            imageUrl,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Image.network(
                'https://cdn.builder.io/api/v1/image/assets/TEMP/87ab71af9a69341667598e6a70f173a7d554e0c6?placeholderIfAbsent=true&apiKey=41aedbfc202f4fad9ee59f7f26112921',
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 4),
              Text(
                likes,
                style: const TextStyle(
                  color: Color(0xFF181C2E),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Sen',
                ),
              ),
              const SizedBox(width: 4),
              Image.network(
                'https://cdn.builder.io/api/v1/image/assets/TEMP/08626e7c7e5c9d223c89125a2b95664959e34c4b?placeholderIfAbsent=true&apiKey=41aedbfc202f4fad9ee59f7f26112921',
                width: 19,
                height: 19 / 1.12,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 4),
              Text(
                comments,
                style: const TextStyle(
                  color: Color(0xFF181C2E),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Sen',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}