


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:unit_test_practice/view_model/user_repository/user_repository.dart';

class Userdataview extends StatelessWidget {
  const Userdataview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
      ),
      body: FutureBuilder(
        future: UserRepository(Client()).getUser(),
        builder: (context , snapshot) {

          /// while waiting for data
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(color: Colors.blueAccent,),
            );
          }

          if(snapshot.hasError){
            print(snapshot.error.toString());
            return Center(
              child: CircularProgressIndicator(color: Colors.red,),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(snapshot.data!.id.toString()),
                Text(snapshot.data!.username.toString()),
                Text(snapshot.data!.name.toString()),
                Text(snapshot.data!.email.toString()),
                Text(snapshot.data!.phone.toString()),
                Text(snapshot.data!.website.toString()),
                Text(snapshot.data!.company!.name.toString()),
                Text(snapshot.data!.company!.catchPhrase.toString()),
                Text(snapshot.data!.address!.city.toString()),
                Text(snapshot.data!.address!.street.toString()),
                Text(snapshot.data!.address!.geo.toString()),
                Text(snapshot.data!.address!.zipcode.toString()),
              ],
            ),
          );

        },
      ),
    );
  }
}
