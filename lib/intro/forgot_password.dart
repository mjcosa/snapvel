import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 480),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 67),
              Image.network(
                'https://cdn.builder.io/api/v1/image/assets/TEMP/d652096a349ca47c43652cd4d9d5193527441a85?placeholderIfAbsent=true&apiKey=41aedbfc202f4fad9ee59f7f26112921',
                width: 94,
                height: 94,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: -10),
              const Text(
                'Reset Password',
                style: TextStyle(
                  color: Color(0xFFF98B00),
                  fontSize: 30,
                  fontFamily: 'Sen',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 46),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF1F214D),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'EMAIL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'Sen',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 19,
                          vertical: 23,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F5FA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'example@gmail.com',
                          style: TextStyle(
                            color: Color(0xFF32343E),
                            fontSize: 14,
                            fontFamily: 'Sen',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          // Handle send code action
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 23,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFBD69),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'SEND CODE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1F214D),
                              fontSize: 14,
                              fontFamily: 'Sen',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}