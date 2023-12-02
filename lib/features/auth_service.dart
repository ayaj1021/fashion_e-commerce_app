import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  sendData() async {
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  var data = {
    'name': 'ayodele',
    'email': 'Eniola3@gmail.com',
    'password': '123456'
  };
  var dio = Dio();
  var response = await dio.request(
    'https://parachbackend.onrender.com/api/users/register',
    options: Options(
      method: 'POST',
      headers: headers,
    ),
    data: data,
  );

  if (response.statusCode == 200) {
    // print(json.encode(response.data));
    
log(
      response.data.toString(),
    );
  } else {
    print(response.statusMessage);
  }
}


  Future<void> signUp({
   // required String name,
    required String email,
    required String password,
  }) async {
    String url = 
    //'https://reqres.in/api/login';
    // 'https://imisi-backend-service.onrender.com/api/users/register';
     'https://parachbackend.onrender.com/api/users/register';
    Dio dio = Dio();

    Map<String, dynamic> data = {
    //  "name": name,
      "email": email,
      "password": password,
    };

    debugPrint(data.toString());
    var response = await dio.post(
      url,
      data: data,
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );

    if (response.statusCode == 200) {
      final body = response.data;
      debugPrint(body.toString());

      return body;
    } else {
      debugPrint(response.data);
      // ScaffoldMessenger.of(context!).showSnackBar(
      //   SnackBar(
      //     content: Text('${response.data["message"]}'),
      //   ),
      // );
    }
  }

  Future<void> login({required String email, required String password}) async {
    String url = 'https://reqres.in/api/login';

    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };

    debugPrint(body.toString());
    var response = await http.post(Uri.parse(url), body: body);
    debugPrint(response.body);

    debugPrint(response.statusCode.toString());
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    } else {
      debugPrint('Error');
    }
  }
}
