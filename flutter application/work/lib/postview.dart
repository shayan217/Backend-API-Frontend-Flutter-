import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:work/postcontroller.dart';
import 'package:work/getview.dart';

class PostView extends StatelessWidget {
  final MainController mainController = Get.put(MainController());

  PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: TextFormField(
              controller: mainController.firstName,
            )
          ),
          Center(
            child: TextFormField(
              controller: mainController.lastName,
            )
          ),
          Center(
            child: TextFormField(
              controller: mainController.email,
            )
          ),
          Center(
            child: TextFormField(
              controller: mainController.password,
            )
          ),
          ElevatedButton(onPressed: (){
            mainController.postData();
            Get.to(Getview());
          }, child: Text("HIT ME"))
        ],
      ),
    );
  }
}
