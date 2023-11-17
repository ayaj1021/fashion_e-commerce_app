import 'package:fashion_ecommerce_app/features/authentication/auth_screens/login_screen.dart';
import 'package:fashion_ecommerce_app/features/authentication/auth_screens/success_screen.dart';
import 'package:fashion_ecommerce_app/features/core/widgets/auth_input_text_field_widget.dart';
import 'package:fashion_ecommerce_app/features/core/widgets/long_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
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
                  'Signup',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Create a new account',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 30),
                AuthInputTextField(
                  obscureText: false,
                  controller: userNameController,
                  labelText: 'User Name',
                ),
                const SizedBox(height: 10),
                AuthInputTextField(
                  controller: emailController,
                  obscureText: false,
                  labelText: 'Email',
                ),
                const SizedBox(height: 10),
                AuthInputTextField(
                  controller: passwordController,
                  obscureText: true,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isPasswordObscure = !isPasswordObscure;
                      });
                    },
                    child: isPasswordObscure == true
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  ),
                  labelText: 'Password',
                ),
                const SizedBox(height: 10),
                AuthInputTextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isConfirmPasswordObscure = !isConfirmPasswordObscure;
                      });
                    },
                    child: isConfirmPasswordObscure == true
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  ),
                  labelText: 'Confirm Password',
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessScreen(),
                      ),
                    );
                  },
                  child: const LongButtonContainer(
                    buttonName: 'Sign up',
                    buttonTextColor: Colors.white,
                    buttonColor: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
