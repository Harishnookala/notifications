import 'package:flutter/material.dart';
import 'package:notifications/notifiers/userdetails.dart';
import 'package:provider/provider.dart';
import 'check.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDetailsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    UserDetailsProvider userDetailsProvider =
        Provider.of<UserDetailsProvider>(context);
    final formKey = GlobalKey<FormState>();
    return MaterialApp(
      color: Colors.purple,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("jack and jill"),
        ),
        body: ListView(
         shrinkWrap: true,
          children: <Widget>[
             Container(
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                          autofocus: true,
                          controller: userDetailsProvider.nameController),
                      TextFormField(
                        autofocus: true,
                        validator: (age) {
                          if (age == null || age.isEmpty) {
                            return "Please enter age";
                          }
                          return null;
                        },
                        controller: userDetailsProvider.ageController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              int age = int.parse(userDetailsProvider.ageController.text);
                              String name = userDetailsProvider.nameController.text;
                              userDetailsProvider.updateName(name);
                              userDetailsProvider.updateAge(age);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  const Check()),
                              );

                            }
                          },
                          child: const Text("Submit")),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                    itemCount: userDetailsProvider.userName.length,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          Text(userDetailsProvider.userName[index]),
                          Text(userDetailsProvider.userAge[index].toString()),
                        ],
                      );

              }),

          ],
        ),
      ),
    );
  }
}
