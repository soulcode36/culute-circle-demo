import 'package:demo/auth/auth.dart';
import 'package:demo/theme/theme.dart';
import 'package:demo/widgets/buttons.dart';
import 'package:demo/widgets/spaces.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.020,
                horizontal: MediaQuery.of(context).size.width * 0.020),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spaces(height: 0.2, width: 0),
                Center(
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.150,
                    backgroundColor: appTheme.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(user.photoURL!)),
                            shape: BoxShape.circle,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Spaces(height: 0.030, width: 0),
                Row(
                  children: [
                    Text(
                      "Name :",
                      style: titleText,
                    ),
                    Spacer(),
                    Text(
                      "${user.displayName} ",
                      style: titleText,
                    ),
                  ],
                ),
                Spaces(height: 0.030, width: 0),
                Row(
                  children: [
                    Text(
                      "Email :",
                      style: titleText,
                    ),
                    Spacer(),
                    Text(
                      "${user.email} ",
                      style: titleText,
                    ),
                  ],
                ),
                Spaces(height: 0.040, width: 0),
                InkWell(
                  onTap: () {
                    AuthServices().signout();
                  },
                  child: Buttons(
                      height: 0.060,
                      width: 0.5,
                      radius: 12,
                      child: Center(
                        child: Text(
                          "Logout",
                          style: categoryText,
                        ),
                      ),
                      color: appTheme.primaryColor.withOpacity(0.9),
                      borderColor: Colors.transparent,
                      borderWidth: 0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
