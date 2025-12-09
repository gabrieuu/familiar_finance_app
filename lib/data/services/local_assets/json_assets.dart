import 'dart:convert';

import 'package:flutter/services.dart';

class JsonAssets {
  static Future<List<Map<String, dynamic>>> loadStringAssets(String pathAssets) async{
    try {
      final json = await rootBundle.loadString(pathAssets);
      return (jsonDecode(json) as List).cast<Map<String, dynamic>>();
    } catch (e) {
      return [];
    }
  }
}

final class Assets{
  Assets._();

  static const String creditcard = 'assets/creditcard.json';
  static const String installments = 'assets/installments.json';
  static const String purchase = 'assets/purchase.json';
}