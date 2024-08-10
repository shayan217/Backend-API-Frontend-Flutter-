import 'dart:convert';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:work/get/model.dart';

class MainGetController extends GetxController {
  var userList = <Model>[].obs; // Reactive list

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    var response = await http.get(Uri.parse('http://10.0.2.2:3000/users'));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) as List;
      userList.value = jsonData.map((e) => Model.fromJson(e)).toList();
    } else {
      print('Failed to load data: ${response.reasonPhrase}');
    }
  }

  void updateUserInList(Model updatedUser) {
    int index = userList.indexWhere((user) => user.sId == updatedUser.sId);
    if (index != -1) {
      userList[index] = updatedUser;
    }
  }

  void deleteUserFromList(String userId) {
    userList.removeWhere((user) => user.sId == userId);
  }
}
