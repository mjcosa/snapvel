import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/auth/presentation/cubits/auth_cubit.dart';
import '../widgets/text_field.dart';

class SignUpScreen extends StatefulWidget {
  final void Function()? onTap;
  const SignUpScreen({super.key, required this.onTap});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void register(){
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String confirmpassword = _confirmPasswordController.text;

    final authCubit = context.read<AuthCubit>();

    if (email.isNotEmpty && name.isNotEmpty && password.isNotEmpty && confirmpassword.isNotEmpty){
      if (password == confirmpassword) {
        authCubit.register(name, email, password);
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords do not match!")));
      }
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please complete all field")));
    }
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                  'https://cdn.builder.io/api/v1/image/assets/TEMP/d6b6c57f24c1671064f2f3828e10aa5830210bcc?placeholderIfAbsent=true&apiKey=41aedbfc202f4fad9ee59f7f26112921',
                                  width: 112,
                                  height: 104,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Please sign up to get started',
                                  style: TextStyle(
                                    color: Color(0xFFF98B00),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    height: 2,
                                    fontFamily: 'Sen',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1F214D),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              label: 'Name',
                              placeholder: 'John doe',
                              controller: _nameController,
                            ),
                            const SizedBox(height: 24),
                            CustomTextField(
                              label: 'Email',
                              placeholder: 'example@gmail.com',
                              controller: _emailController,
                            ),
                            const SizedBox(height: 24),
                            CustomTextField(
                              label: 'Password',
                              placeholder: '**********',
                              isPassword: true,
                              controller: _passwordController,
                            ),
                            const SizedBox(height: 24),
                            CustomTextField(
                              label: 'Re-Type Password',
                              placeholder: '**********',
                              isPassword: true,
                              controller: _confirmPasswordController,
                            ),
                            const SizedBox(height: 47),
                            TextButton(
                              onPressed: register,
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFFFFBD69),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 70,
                                  vertical: 23,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Sen',
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Sen',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: widget.onTap,
                                  child: const Text(
                                    'Log in',
                                    style: TextStyle(
                                      color: Color(0xFFFFBD69),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Sen',
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
