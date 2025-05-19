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
              Image.asset(
                avatarUrl, // Pass a local path like 'assets/images/avatar1.png'
                width: 40,
                height: 40,
                fit: BoxFit.cover,
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
          Image.asset(
            imageUrl, // Pass a local path like 'assets/images/post1.jpg'
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Image.asset(
                'assets/icons/like.png', 
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
              Image.asset(
                'assets/icons/share.png',
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
