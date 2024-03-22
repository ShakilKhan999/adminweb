import 'dart:convert';

import 'package:adminweb/repository/dashboard_repository.dart';
import 'package:adminweb/usermodel.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  var userList = [].obs;
  var isDateSelected = false.obs;
  var isGenderSelected = false.obs;
  var selectedGender = "Male".obs;
  var dateTime = DateTime.now().obs;

  @override
  void onInit() {
    fetchUserList();
    super.onInit();
  }

  var loading = false.obs;

  Future<void> fetchUserList() async {
    loading.value = true;
    final url = Uri.parse(
        'https://tiny-jade-chicken-hose.cyclic.app/api/v1/user/get-by-app-key/app1');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        final userModel = UserModel.fromJson(jsonData);
        // userList.assignAll(userModel.data);
        userList.value = userModel.data;
        loading.value = false;
        userList.refresh();
        print('adfadsfadf');
        
      } else {
        if (kDebugMode) {
          print('Failed to fetch user data: ${response.reasonPhrase}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user data: $e');
      }
    }
  }

  Future updateUser({
    required String userId,
    required String fullName,
    required String dateOfBirth,
    required String gender,
    required bool agreeToMarketing,
    required bool correspond,
    required String updatedAt,
    required double lat,
    required double long,
    required String createdAt,
    required String subjectCategory
  }) async {
    bool result = await DashboardRepository().updateUserById(
        lat: lat,
        long: long,
        userId: userId,
        fullName: fullName,
        dateOfBirth: dateOfBirth,
        gender: gender,
        agreeToMarketing: agreeToMarketing,
        correspond: correspond,
        updatedAt: updatedAt, createdAt: createdAt, subjectCategory: [subjectCategory]);
    if (result) {
      fetchUserList();
    }
  }

  Future deleteUser({required String userId}) async {
    try{
      bool result = await DashboardRepository().deleteUser(userId: userId);
      if(result) {
        fetchUserList();
      }
    }catch(e){}
  }
}
