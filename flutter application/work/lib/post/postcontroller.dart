import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class MainController extends GetxController {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> postData() async {
    final url = Uri.parse('http://10.0.2.2:3000/users');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "firstName": firstName.text,
        "lastName": lastName.text,
        "email": email.text,
        "password": password.text,
      }),
    );

    if (response.statusCode == 200) {
      print('User created: ${response.body}');
    } else {
      print('Failed to create user: ${response.reasonPhrase}');
    }
  }
}
