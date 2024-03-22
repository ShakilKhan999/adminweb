import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DashboardRepository {
  Future<bool> updateUserById({
    required double? lat,
    required double? long,
    required String userId,
    required String fullName,
    required String dateOfBirth,
    required String gender,
    required bool agreeToMarketing,
    required bool correspond,
    required String updatedAt,
    required String createdAt,
    required List subjectCategory,
  }) async {
    //EasyLoading.show();
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'PATCH',
      Uri.parse(
          'https://tiny-jade-chicken-hose.cyclic.app/api/v1/user/update-user-by-id/$userId'),
    );
    request.body = json.encode({
      "SubjectCategory": subjectCategory,
      "_id": userId,
      "fullName": fullName,
      "AppKey": "app1",
      "dateOfBirth": dateOfBirth,
      "Gender": gender,
      "agreeToMarketing": agreeToMarketing,
      "latitude": lat,
      "longitude": long,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "__v": 0,
      "correspond": correspond
    });
    log('afdfasdf: ' + request.body.toString());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // EasyLoading.dismiss();
      if (kDebugMode) {
        print(" Updating: ${await response.stream.bytesToString()}");
      }
      return true; // Update successful
    } else {
      var error = await response.stream.bytesToString();
      if (kDebugMode) {
        print("Error Updating: ${error.toString()}");
      }
      //EasyLoading.dismiss();
      return false; // Update failed
    }
  }

  Future<bool> deleteUser({required String userId}) async {
    var request = http.Request(
        'DELETE',
        Uri.parse(
            'https://tiny-jade-chicken-hose.cyclic.app/api/v1/user/$userId'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
