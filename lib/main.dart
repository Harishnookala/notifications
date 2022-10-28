import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notifications/Api/api.dart';
import 'package:notifications/notifiers/decrement_Counter.dart';
import 'package:provider/provider.dart';

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
        title: 'Provider Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: MyHomePage(title: 'Provider Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  UserDetailsProvider item = UserDetailsProvider();
  final String? title;
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    UserDetailsProvider userDetailsProvider =
        Provider.of<UserDetailsProvider>(context);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 450,
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
                          pressed = true;
                        }
                      },
                      child: const Text("Submit")),
                ],
              ),
            ),
          ),
          pressed
              ? Consumer<UserDetailsProvider>(
                  builder: (context, provider, child) {
                    return Column(
                      children: [
                        Text('Hi ,${provider.userName}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text('You are ${provider.userAge} years old',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    );
                  },
                )
              : Container()
        ],
      ),
    );
  }
}
