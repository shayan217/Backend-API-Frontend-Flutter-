import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DeleteController extends GetxController {
  Future<void> deleteUser(String userId) async {
    final url = Uri.parse('http://10.0.2.2:3000/users/$userId');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      print('User deleted successfully');
    } else {
      print('Failed to delete user: ${response.reasonPhrase}');
    }
  }
}
