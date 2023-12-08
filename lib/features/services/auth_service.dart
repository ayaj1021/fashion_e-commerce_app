// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:fashion_ecommerce_app/features/authentication/auth_screens/success_screen.dart';
import 'package:fashion_ecommerce_app/features/screens/category_screen.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    String url =
        //'https://reqres.in/api/login';
        // 'https://imisi-backend-service.onrender.com/api/users/register';
        'https://parachbackend.onrender.com/api/users/register';

    Map<String, dynamic> body = {
      "name": name,
      "email": email,
      "password": password,
    };
    print(body);
    try {
      var response = await http.post(
        Uri.parse(url),
        body: body,
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SuccessScreen(),
          ),
        );
        print(data);

        return data;
      } else {
        debugPrint(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              data['message'],
            ),
          ),
        );
      }
    } catch (e) {
      throw Exception('Error $e');
    }
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    String url = 'https://parachbackend.onrender.com/api/users/login';

    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };

    print(body);
    var response = await http.post(Uri.parse(url), body: body);
    debugPrint(response.body);

    debugPrint(response.statusCode.toString());
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomnavScreen(),
        ),
      );
      return data;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            data['message'],
          ),
        ),
      );
      debugPrint('Error');
    }
  }
}
