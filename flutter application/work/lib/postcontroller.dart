import "dart:convert";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:get/get_state_manager/get_state_manager.dart";
import "package:http/http.dart" as http;

class MainController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> postData() async {
    final url = Uri.parse('http://10.0.2.2:3000/users');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "firstName": firstName.value.text,
        "lastName": lastName.value.text,
        "email": email.value.text,
        "password": password.value.text,
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Failed to post data: ${response.reasonPhrase}');
    }
  }
}




    // var request = http.Request('GET', Uri.parse('http://10.0.2.2:3000/users'));
    // request.body = '''''';

    // http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // } else {
    //   print(response.reasonPhrase);
    // }