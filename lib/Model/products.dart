class Listofproducts {
  List<Products>? products;

  Listofproducts({this.products});

  Listofproducts.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? name;
  String? description;
  String? quantity;

  Products({this.name, this.description, this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    return data;
  }
}
