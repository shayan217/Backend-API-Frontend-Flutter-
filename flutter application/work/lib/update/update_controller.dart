import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:work/get/model.dart';

class UpdateController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String userId;

  UpdateController(this.userId);

  Future<Model?> updateData() async {
    final url = Uri.parse('http://10.0.2.2:3000/users/$userId');
    final response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      print('User updated successfully');
      return Model.fromJson(json.decode(response.body));
    } else {
      print('Failed to update data: ${response.reasonPhrase}');
      return null;
    }
  }
}
