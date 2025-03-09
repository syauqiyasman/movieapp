import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  int _tab = 0;
  String _fullname = "";
  String _nickname = "";
  String _hobbies = "";
  String _instagram = "";

  int get tab => _tab;
  String get fullname => _fullname;
  String get nickname => _nickname;
  String get hobbies => _hobbies;
  String get instagram => _instagram;

  AppProvider() {
    _loadFromPrefs();
  }

  set tab(int value) {
    _tab = value;
    _saveToPrefs();
    notifyListeners();
  }

  set fullname(String value) {
    _fullname = value;
    _saveToPrefs();
    notifyListeners();
  }

  set nickname(String value) {
    _nickname = value;
    _saveToPrefs();
    notifyListeners();
  }

  set hobbies(String value) {
    _hobbies = value;
    _saveToPrefs();
    notifyListeners();
  }

  set instagram(String value) {
    _instagram = value;
    _saveToPrefs();
    notifyListeners();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("tab", _tab);
    await prefs.setString("fullname", _fullname);
    await prefs.setString("nickname", _nickname);
    await prefs.setString("hobbies", _hobbies);
    await prefs.setString("instagram", _instagram);
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _tab = prefs.getInt("tab") ?? 0;
    _fullname = prefs.getString("fullname") ?? "";
    _nickname = prefs.getString("nickname") ?? "";
    _hobbies = prefs.getString("hobbies") ?? "";
    _instagram = prefs.getString("instagram") ?? "";
    notifyListeners();
  }
}
