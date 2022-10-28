import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';
import '../Model/products.dart';
class Api{
   Future<Listofproducts>loaddata(context) async {
    String products = await DefaultAssetBundle.of(context).loadString("assets/Images/assignment.json");
    final decode  = json.decode(products);
    final values = Listofproducts.fromJson(decode);
   return values;
  }
}