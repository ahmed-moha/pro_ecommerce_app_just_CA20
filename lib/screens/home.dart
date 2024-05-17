import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:ecommerce_app/components/category_card.dart';
import 'package:ecommerce_app/components/header_card.dart';
import 'package:ecommerce_app/components/product_card.dart';
import 'package:ecommerce_app/providers/user.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../components/search_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: const SizedBox(),
        toolbarHeight: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Gap(kPadding),
                const HeaderCard(),
                const Gap(kPadding),
                const SearchCard(),
                const Gap(kPadding),
                const CategoryCard(),
                const Gap(kPadding),
                 const Padding(
                   padding: EdgeInsets.symmetric(
                    horizontal: kPadding
                   ),
                   child: Text("Trending Products 🔥"),
                 ),
                 const Gap(kPadding),
                 const ProductCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).getUser();
  }
}




