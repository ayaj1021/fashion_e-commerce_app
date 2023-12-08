import 'package:fashion_ecommerce_app/features/services/auth_service.dart';
import 'package:fashion_ecommerce_app/features/authentication/auth_screens/login_screen.dart';
import 'package:fashion_ecommerce_app/features/core/widgets/auth_input_text_field_widget.dart';
import 'package:fashion_ecommerce_app/features/core/widgets/long_button_widget.dart';
//import 'package:fashion_ecommerce_app/features/screens/pages/home_screen.dart';
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

  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
  bool isLoading = false;

  // signUp() async {
  //   setState(() {
  //       isLoading = true;
  //     });
  //   User? currentUser;
  //   await firebaseAuth
  //       .createUserWithEmailAndPassword(
  //           email: emailController.text.trim(),
  //           password: passwordController.text.trim())
  //       .then((auth) {
  //     currentUser = auth.user;
  //   }).catchError((error) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.red,
  //         content: Text(error.toString()),
  //       ),
  //     );
  //   },);
  //   if (currentUser != null) {

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: Colors.green,
  //         content: Text('Signup succesful'),
  //       ),
  //     );
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const SuccessScreen(),
  //       ),
  //     );
  //     setState(() {
  //       isLoading = false;
  //     });
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: Colors.red,
  //         content: Text('Not signed'),
  //       ),
  //     );
  //   }
  // }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
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
                    validate: (name) {
                      if (name == null || name.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    obscureText: false,
                    controller: userNameController,
                    labelText: 'User Name',
                  ),
                  const SizedBox(height: 10),
                  AuthInputTextField(
                    validate: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                    controller: emailController,
                    obscureText: false,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 10),
                  AuthInputTextField(
                    validate: (password) {
                      if (password == null || password.isEmpty) {
                        return ' Please enter your password';
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: isPasswordObscure,
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
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        //  signUp();
                        // AuthService().sendData(
                        //     name: userNameController.text.trim(),
                        //     email: emailController.text.trim(),
                        //     password: passwordController.text.trim());

                        AuthService()
                            .signUp(
                                context: context,
                                name: userNameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim())
                            .then((value) {
                          setState(() {
                            isLoading = false;
                          });
                        });
                      }
                    },
                    child: LongButtonContainer(
                      buttonName: isLoading == true ? 'Loading...' : 'Sign up',
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
      ),
    );
  }
}


// User? currentUser;

//     await firebaseAuth
//         .createUserWithEmailAndPassword(
//             email: emailController.text.trim(),
//             password: passwordController.text.trim())
//         .then((auth) {
//       currentUser = auth.user;
//     }).catchError((error) {
//       debugPrint(error);
//     });
//     if (currentUser != null) {
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => const SuccessScreen()));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           backgroundColor: Colors.green,
//           content: Text('User not found'),
//         ),
//       );
//     }