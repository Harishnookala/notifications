import 'package:flutter/material.dart';

class ProductsNotifier extends ChangeNotifier {
   List item =[];
   List price =[];
   List get itemname => item;
   List get itemprice => price;

   void updateAge(String name,int price) {
     itemname.add(name);
     itemprice.add(price);
     notifyListeners();
   }
}