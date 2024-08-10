import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work/update/update_controller.dart';

class Update extends StatelessWidget {
  final String userId;
  final UpdateController updateController;

  Update({required this.userId, Key? key})
      : updateController = Get.put(UpdateController(userId)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: updateController.firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: updateController.lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: updateController.emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: updateController.passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var updatedUser = await updateController.updateData();
                if (updatedUser != null) {
                  Get.back(result: updatedUser);
                }
              },
              child: Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }
}
