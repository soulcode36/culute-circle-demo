import 'package:demo/auth/auth.dart';
import 'package:demo/bottom%20nav%20bar/bottom_nav_bar_screen.dart';
import 'package:demo/theme/theme.dart';
import 'package:demo/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return BottomNavBar();
          }
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: appTheme.primaryColor.withOpacity(0.5),
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage("assets/images/sneakers.png"))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              InkWell(
                onTap: () {
                  AuthServices().signinWithGoogle();
                },
                child: Buttons(
                    height: 0.060,
                    width: 0.5,
                    radius: 8,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.010),
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.040,
                            width: MediaQuery.of(context).size.height * 0.040,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        'https://imgs.search.brave.com/zMpX1M2zlKnkFSHGXM93wcSbWdvbNqihwhIko6Vl9yY/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC43/OHBMaXZzQUxYU0hq/aHk5Tkh1QjR3SGFI/YSZwaWQ9QXBp'))),
                          ),
                          Spacer(),
                          Text(
                            "Login With google",
                            style: categoryText,
                          )
                        ],
                      ),
                    ),
                    color: Colors.lightGreen,
                    borderColor: Colors.transparent,
                    borderWidth: 0),
              )
            ],
          );
        },
      )),
    );
  }
}
