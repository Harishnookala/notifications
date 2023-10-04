import 'package:flutter/material.dart';

import 'Api/api.dart';
import 'Model/products.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>();
  int? tappedIndex;
  List<bool> pressedAttentions = [];
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepOrange.shade200,
        body: ListView(
          shrinkWrap: true,
          children: [
            FutureBuilder<Listofproducts>(
              future: Api().loaddata(context),
              builder: (context, snap) {
                if (snap.hasData) {
                  var data = snap.data;
                  return Container(
                    margin: const EdgeInsets.all(12.3),
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data!.products!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.3)),
                                child: Container(
                                  margin:const EdgeInsets.only(top:12.3),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(12.3),
                                            child: const Text("Name : - "),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.all(12.3),
                                            child: Text(data
                                                .products![index].name!
                                                .toUpperCase()),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(12.3),
                                            child: const Text("Quantity : - "),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.all(12.3),
                                            child: Text(data
                                                .products![index].quantity!),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(15.3),
                                            alignment: Alignment.bottomLeft,
                                            child:
                                                const Text("Description : - "),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 12.3,
                                                left: 5.3,
                                                bottom: 12.3),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.3),
                                            child: Text(data
                                                .products![index].description!),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(12.3),
                                            child: const Text("Price : - "),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.all(12.3),
                                            child: Text(
                                                "₹ ${data.products![index].price!}"),
                                          ),
                                        ],
                                      ),
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.3),
                                              border: Border.all(
                                                  color: Colors.blueAccent)),
                                          child: InkWell(
                                            customBorder:
                                                Border.all(color: Colors.white),
                                            onTap: () {
                                              setState(() {
                                                print(
                                                    data.products![index].name);
                                              });

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) =>   MyHomePage()),
                                              );
                                            },
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 12.3,
                                                    right: 16.3,
                                                    top: 5.3,
                                                    bottom: 5.3),
                                                child: const Text("+ Add")),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          );
                        }),
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
