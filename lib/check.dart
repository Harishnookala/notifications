import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifiers/counter.dart';
import 'main.dart';

class check extends StatelessWidget {
  const check({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Consumer<Counter>(
        builder: (context,counter,text){
          return Text(counter.count.toString());
        },
      )
    );
  }
}
