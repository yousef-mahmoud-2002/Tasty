import 'package:flutter/material.dart';

class RecipeSearchBar extends StatelessWidget {
  const RecipeSearchBar({super.key, this.onChanged, required this.controller});

  final void Function(String)? onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      onChanged: onChanged,
      controller: controller,
      cursorColor: Colors.white,
      textInputAction: TextInputAction.search,
      style: const TextStyle(color: Colors.white),
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Search for recipes ...',
        hintStyle: TextStyle(color: Colors.white),
        suffixIcon: Icon(Icons.search, color: Colors.white),
      ),
    );
  }
}
