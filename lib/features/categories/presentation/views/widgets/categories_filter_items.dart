import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> categoriesFilterItems = const [
  DropdownMenuItem(
    value: 'Category',
    child: Text(
      'Category',
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  DropdownMenuItem(
    value: 'Area',
    child: Text(
      'Cuisine',
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
];
