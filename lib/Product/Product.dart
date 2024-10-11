import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_firstproject/Model/ProductModel.dart';
import 'package:http/http.dart' as http;

class Product extends StatefulWidget {
  const Product({super.key});
  static const productRouteName = "/Product";

  @override
  State<Product> createState() => _ProductState();

  Future<List<ProductModel>> requestProductList() async {
   final uri = Uri.https('dummyjson.com', 'products', {
     'limit' : '10'
   });
   final response = await http.get(uri);

   if (response.statusCode == 200) {
     Map<String, dynamic> mapData = jsonDecode(response.body);
     List<ProductModel> model = (mapData['products'] as List).map((v) {
       return ProductModel.fromJson(v);
     }).toList();

     return model;
   } else {
     print("Error ${response.statusCode}");
     return [];
   }
  }
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product"),),
      body:
      ElevatedButton(
          onPressed: () async {
            print(await widget.requestProductList());
          },
          child: Text("123")),
    );
  }
}
