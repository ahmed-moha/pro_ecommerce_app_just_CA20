import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../utils/constants.dart';
class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kPadding),
      decoration:  BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8)
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search",
          border: InputBorder.none,
          prefixIcon: Icon(IconlyLight.search)
        ),
      ),
    );
  }
}