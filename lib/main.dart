import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: "GFG",
        theme:  ThemeData(
            primarySwatch: Colors.green
        ),
        debugShowCheckedModeBanner: false,
        home: const WrapW()
    );
  }
}

class WrapW extends StatelessWidget {
  const WrapW({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("GeeksForGeeks"),
      ),
      body: Wrap(
         direction: Axis.horizontal,
         alignment: WrapAlignment.center,
           spacing:8.0,
         runAlignment:WrapAlignment.center,
          runSpacing: 12.0,
        crossAxisAlignment: WrapCrossAlignment.center,
         textDirection: TextDirection.rtl,
         verticalDirection: VerticalDirection.up,
        children: <Widget>[
          Container(
              color: Colors.blue,
              width: 100,
              height: 100,
              child:const Center(child: Text("W1"))
          ),
          Container(
              color: Colors.red,
              width: 100,
              height: 100,
              child:const Center(child: Text("W2",style: TextStyle(fontSize: 15),))
          ),
          Container(
              color: Colors.teal,
              width: 100,
              height: 100,
              child:const Center(child: Text("W3"))
          ),
          Container(
              color: Colors.indigo,
              width: 100,
              height: 100,
              child:const Center(child: Text("W4"))
          ),
          Container(
              color: Colors.orange,
              width: 100,
              height: 100,
              child:const Center(child: Text("W5"))
          ),
        ],
      ),
    );
  }
}
