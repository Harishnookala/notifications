import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notifiers/userdetails.dart';

class check extends StatelessWidget {
  const check({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Consumer<UserDetailsProvider>(
        builder: (context,user,text){
          return Center(
                child: Column(
                  children: [
                    Text(user.name.toString())
                  ],
                ),
              );
        },
      )
    );
  }
}
