import 'dart:convert';

import 'package:http/http.dart' as http;


import 'package:unit_test_practice/model/user_model.dart';

class UserRepository {

  final http.Client client;
  UserRepository(this.client);

  Future<UserModel> getUser() async {

    final responce = await client.get(Uri.parse("https://jsonplaceholder.typicode.com/users/1"));

    if(responce.statusCode == 200){
      final Map<String, dynamic> jsonData = json.decode(responce.body);
      return UserModel.fromJson(jsonData);
    }

    throw Exception("Error occurred while getting user Data");

  }


}