import 'package:fashion_ecommerce_app/features/authentication/auth_screens/signup_screen.dart';
import 'package:fashion_ecommerce_app/features/core/widgets/auth_input_text_field_widget.dart';
import 'package:fashion_ecommerce_app/features/core/widgets/long_button_widget.dart';
import 'package:fashion_ecommerce_app/features/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: Image.asset(
                        'assets/images/app_logo.png',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  'Welcome',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Pls login or sign up to continue our app',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 30),
                AuthInputTextField(
                  controller: emailController,
                  obscureText: false,
                  labelText: 'Email',
                ),
                const SizedBox(height: 30),
                AuthInputTextField(
                  controller: passwordController,
                  obscureText: isObscure,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: isObscure == true
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  ),
                  labelText: 'Password',
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomnavScreen()));
                  },
                  child: const LongButtonContainer(
                    buttonName: 'Login',
                    buttonColor: Colors.black,
                    buttonTextColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                // Center(
                //     child: Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text('Don\'t have an account?'),
                //     Text(
                //       'Sign up',
                //       style: GoogleFonts.poppins(color: Colors.blue),
                //     ),
                //   ],
                // ),),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account?   ',
                        style: GoogleFonts.poppins(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: GoogleFonts.poppins(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1,
                      width: 180,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                    ),
                    const Text('Or'),
                    Container(
                      height: 1,
                      width: 180,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const LongButtonContainer(
                  icon: Icons.facebook,
                  buttonName: 'Continue with facebook',
                  buttonColor: Colors.blue,
                  buttonTextColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
