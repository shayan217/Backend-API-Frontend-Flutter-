import "dart:convert";

import "package:get/get_state_manager/get_state_manager.dart";
import "package:http/http.dart" as http;
import "package:work/model.dart";

class MainGetController extends GetxController {
  Future<List<Model>> getData() async {
    var request = http.Request('GET', Uri.parse('http://10.0.2.2:3000/users'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String JsonResponse = await response.stream.bytesToString();
      List JsonData = json.decode(JsonResponse);
      return JsonData.map((e)=> Model.fromJson(e)).toList();
    } else {
      print(response.reasonPhrase);
    }throw{
      Exception("Error not found")
    };
  }
}
