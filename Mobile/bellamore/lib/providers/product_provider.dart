import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/products/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> productData = json.decode(response.body);
        _products = productData.map((data) => Product.fromJson(data)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print('Error fetching products: $error'); // Log error for debugging
      throw error;
    }
  }

  Future<List<Product>> fetchProductsFuture() async {
    await fetchProducts(); // This ensures products are fetched and _products is updated
    return _products;
  }
}