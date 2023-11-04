import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/model/user_model_class.dart';

class HomescreenController extends ChangeNotifier {
  bool isLoading = false;
  UserApiRsponse? userResponse;

  getEmployeeData() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      userResponse = UserApiRsponse.fromJson(decodedData);

      // Convert the map of users to a list
      List<UserApiRsponse> userList = [];
      for (var userData in decodedData) {
        userList.add(UserApiRsponse.fromJson(userData));
      }

      // Update the userResponse with the list of users
      

      print(response.body);
    } else {
      print("Error");
    }
    isLoading = false;
    notifyListeners();
  }
}
