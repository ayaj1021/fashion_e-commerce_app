// ignore_for_file: use_build_context_synchronously

import 'package:fashion_ecommerce_app/features/authentication/auth_screens/signup_screen.dart';
import 'package:fashion_ecommerce_app/features/core/widgets/auth_input_text_field_widget.dart';
import 'package:fashion_ecommerce_app/features/core/widgets/long_button_widget.dart';
import 'package:fashion_ecommerce_app/features/screens/category_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  login() async {
    User? currentUser;

    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((auth) {
      currentUser = auth.user;
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(error.toString()),
        ),
      );
    });

    if (currentUser != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Signup succesful'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomnavScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Not Logged in'),
        ),
      );
    }
  }

  bool isObscure = true;

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Form(
              key: _formKey,
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
                    validate: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Please enter your mail';
                      } else if (!email.contains('@') || !email.contains('.')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    controller: emailController,
                    obscureText: false,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 30),
                  AuthInputTextField(
                    validate: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Please enter your password';
                      } else if (password.length < 6) {
                        return 'Password should be a minimum of 6 characters';
                      }
                      return null;
                    },
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
                      setState(() {
                        isLoading = true;
                      });
                      if (_formKey.currentState!.validate()) {
                        login();
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    child: LongButtonContainer(
                      buttonName: isLoading == true ? 'Loading...' : 'Login',
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
      ),
    );
  }
}


// login() async {
//     setState(() {
//       isLoading = true;
//     });
//     User? currentUser;
//     await firebaseAuth
//         .signInWithEmailAndPassword(
//             email: emailController.text.trim(),
//             password: passwordController.text.trim())
//         .then((auth) {
//       currentUser = auth.user;
//     }).catchError((error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: Colors.red,
//           content: Text(error.toString()),
//         ),
//       );
//     });

//     if (currentUser != null) {
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => const BottomnavScreen()));
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }
