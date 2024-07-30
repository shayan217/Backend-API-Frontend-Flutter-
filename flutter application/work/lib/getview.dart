import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:work/getcontroller.dart';
import 'package:work/model.dart';

class Getview extends StatelessWidget {
  MainGetController mainGetController = Get.put(MainGetController());
  Getview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
        body: FutureBuilder(
      future: mainGetController.getData(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) {
            Model model = snapshot.data![index];
            return Column(
              children: [
                SizedBox(height: 20,),
                Card(
                  child: Column(
                    children: [
                      Center(
                        child: Text("First Name : ${model.firstName}",style: TextStyle(fontSize: 20),),
                      ),
                      Center(
                        child: Text("Last Name : ${model.lastName}",style: TextStyle(fontSize: 20),),
                      ),
                      Center(
                        child: Text("Email Name : ${model.email}",style: TextStyle(fontSize: 20),),
                      ),
                      Center(
                        child: Text("Password Name : ${model.password}",style: TextStyle(fontSize: 20),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,)
              ],
            );
          },
        );
      },
    ));
  }
}
