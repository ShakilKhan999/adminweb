import 'dart:convert';

import 'package:adminweb/usermodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  var userList = [].obs;

  @override
  void onInit() {
    fetchUserList();
    super.onInit();
  }

  Future<void> fetchUserList() async {
    final url =
        Uri.parse('https://tiny-jade-chicken-hose.cyclic.app/api/v1/user');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        final userModel = UserModel.fromJson(jsonData);
        userList.assignAll(userModel.data);
      } else {
        print('Failed to fetch user data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}
