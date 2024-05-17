import 'package:ecommerce_app/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
class HeaderCard extends StatelessWidget {
  const HeaderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context,cont,child) {
        return Row(
          children: [
             Expanded(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                  cont.user.photo??    "https://avatars.githubusercontent.com/u/11613304?v=4"),
                ),
                title: Text( cont.user.name?? "Ahmed Mohamed "),
                subtitle: const Text("Welcome Back"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: kPadding),
              padding: const EdgeInsets.all(10),
              decoration:   BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
                
              ),
              child: const Icon(
                IconlyLight.notification,
                // color: Colors.white,
              ),
            )
          ],
        );
      }
    );
  }
}