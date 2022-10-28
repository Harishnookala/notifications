import 'package:flutter/material.dart';
import 'package:notifications/main.dart';
import 'package:provider/provider.dart';
import 'package:notifications/check.dart';

import 'notifiers/counter.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            TextButton(onPressed: (){
              counter.increment();
            },child: const Icon(Icons.add),),
            Text(counter.count.toString()),
            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const check()));
            }, child: const Text("Next"))
          ],
        )
      ),
    );
  }
}
