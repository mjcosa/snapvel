import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildInfoRow(
            icon: Icons.person_outline,
            title: 'FULL NAME',
            value: 'Juan Dela Cruz',
            iconColor: const Color(0xFFFB6F3D),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            icon: Icons.email_outlined,
            title: 'EMAIL',
            value: 'jcruz@gmail.com',
            isEmail: true,
            iconColor: const Color(0xFF413DFB),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            icon: Icons.phone_outlined,
            title: 'PHONE NUMBER',
            value: '408-841-0926',
            iconColor: const Color(0xFF369BFF),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
    bool isEmail = false,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF32343E),
                fontFamily: 'Sen',
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: const Color(0xFF6B6E82),
                decoration: isEmail ? TextDecoration.underline : TextDecoration.none,
                fontFamily: 'Sen',
              ),
            ),
          ],
        ),
      ],
    );
  }
}