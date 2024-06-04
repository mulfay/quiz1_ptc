import 'dart:convert';

import 'package:faker/src/faker.dart';
import 'package:flutter/services.dart';

class LazyLoading {
  List<dynamic>? _languages;
  late final List<String> _categories = _getCategories();
  late final List<String> _venues = _getVenues();

  LazyLoading._privateConstructor();

  static LazyLoading? _instance;

  factory LazyLoading.getInstance() {
    _instance ??= LazyLoading._privateConstructor();
    return _instance!;
  }
  loadLanguages() async {
    _languages ??= await _getLanguages();
    return _languages;
  }

  List<String> get loadCategories => _categories;

  List<String> get loadVenues => _venues;

  _getCategories() {
    List<String> items = [];
    for (int i = 0; i < 1000; i++) items.add(faker.lorem.words(3).join(' '));
    return items;
  }

  _getVenues() {
    List<String> items = [];
    for (int i = 0; i < 1000; i++) items.add(faker.lorem.words(2).join(' '));
    return items;
  }

  _getLanguages() async {
    List<dynamic> items;
    String filePath = "assets/languages.json";
    String jsonString = await rootBundle.loadString(filePath);
    items = await json.decode(jsonString);
    return items;
  }
}
