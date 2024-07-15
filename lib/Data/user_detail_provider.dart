import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/Model/user_list_model.dart';

class UserDetailsProvider extends ChangeNotifier{
  final client = http.Client();
  // DECLARE TEXT EDITING CONTROLLER
  final userId = TextEditingController();
  final name   = TextEditingController();
  final whatsapp = TextEditingController();
  final address = TextEditingController();
  final requirement = TextEditingController();

List<UserList> userList =[];

   Future<UserListModel> userDetailApi() async {
    final response = await client.get(
        Uri.parse(
            "https://api.theleafytea.com/prisma/leafy/wholesale"),
        );
        print(response.body);
        return userListModelFromJson(response.body);
  }

  void fetchUserList(){
     userDetailApi().then((value) {
       if (value.data.isNotEmpty ){
        userList = value.data;
        print(userList);
        notifyListeners();
       }

    },);
  }

  //  * Post -----------------
   Future userDetailsApi() async {
    final response = await client.post(
      
        Uri.parse(
            "https://api.theleafytea.com/prisma/leafy/wholesale"),
        body: <String, dynamic>{
         
            "userId": "NA",
          "name": name.text.trim(),
          "whatsapp": whatsapp.text.trim(),
          "address": address.text.trim(),
          "requirement": requirement.text.trim(),
        }
        );
    final result = jsonDecode(response.body);
    return result;
  }
}