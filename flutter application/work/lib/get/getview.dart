import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work/get/getcontroller.dart';
import 'package:work/get/model.dart';
import 'package:work/update/update.dart';
import 'package:work/delete/delete.dart';

class Getview extends StatelessWidget {
  final MainGetController mainGetController = Get.put(MainGetController());

  Getview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Obx(() {
        return ListView.builder(
          itemCount: mainGetController.userList.length,
          itemBuilder: (context, index) {
            Model model = mainGetController.userList[index];
            return Column(
              children: [
                SizedBox(height: 20),
                Card(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "First Name: ${model.firstName}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Last Name: ${model.lastName}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Email: ${model.email}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Password: ${model.password}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        var updatedUser = await Get.to(
                          Update(userId: model.sId.toString()),
                        );
                        if (updatedUser != null) {
                          mainGetController.updateUserInList(updatedUser);
                        }
                      },
                      child: Text("Update"),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => Delete(userId: model.sId.toString()))!
                            .then((_) {
                          mainGetController.deleteUserFromList(model.sId!);
                        });
                      },
                      child: Text("Delete"),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
