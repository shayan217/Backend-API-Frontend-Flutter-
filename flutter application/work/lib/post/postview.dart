import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work/post/postcontroller.dart';
import 'package:work/get/getview.dart';

class PostView extends StatelessWidget {
  final MainController mainController = Get.put(MainController());

  PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create User")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: mainController.firstName,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            TextFormField(
              controller: mainController.lastName,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            TextFormField(
              controller: mainController.email,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: mainController.password,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                mainController.postData();
                Get.to(Getview());
              },
              child: const Text("Create User"),
            )
          ],
        ),
      ),
    );
  }
}
