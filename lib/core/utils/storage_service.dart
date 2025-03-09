import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<void> saveFeaturedBooks(List<dynamic> featuredBooks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'featuredBooks_data', jsonEncode({'featuredBooks': featuredBooks}));
  }

  static Future<Map<String, dynamic>?> getFeaturedBooks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString('featuredBooks_data');
    if (jsonString == null) return null;

    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  static Future<void> saveNewestBooks(List<dynamic> newsetBooks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'newsetBooks_data', jsonEncode({'newsetBooks': newsetBooks}));
  }

  static Future<Map<String, dynamic>?> getNewestBooks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString('newsetBooks_data');
    if (jsonString == null) return null;

    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  static Future<void> saveSimilarBooks(
      String category, List<dynamic> similarBooks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('similarBooks_data_$category',
        jsonEncode({'similarBooks': similarBooks}));
  }

  static Future<Map<String, dynamic>?> getSimilarBooks(String category) async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString('similarBooks_data_$category');
    if (jsonString == null) return null;

    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }
}
