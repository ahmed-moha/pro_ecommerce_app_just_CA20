import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    username.dispose();
    password.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Gap(16),
          const Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Placeholder(),
            ),
          ),
          const Gap(kPadding),
          const Text(
            "WELCOME!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Gap(8),
          const Text(
            "Please enter your credentials to sign up",
            style: TextStyle(
                // fontSize: 24,

                ),
          ),
          const Gap(kPadding),
          Container(
            width: 80,
            height: 5,
            decoration: const BoxDecoration(color: kPrimaryColor),
          ),
          const Gap(kPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  prefixIcon: Icon(
                    IconlyBold.profile,
                    color: kPrimaryColor,
                  )),
            ),
          ),
          const Gap(kPadding * 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: TextField(
              controller: username,
              decoration: const InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  prefixIcon: Icon(
                    IconlyBold.profile,
                    color: kPrimaryColor,
                  )),
            ),
          ),
          const Gap(kPadding * 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(fontWeight: FontWeight.w300),
                prefixIcon: Icon(
                  IconlyBold.lock,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
          const Gap(8),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      child: const RegisterScreen(),
                      type: PageTransitionType.fade)),
              child: const Text(
                "Don't have an account?",
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
          ),
          const Gap(kPadding),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: kPadding),
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ]),
      ),
    );
  }
}
