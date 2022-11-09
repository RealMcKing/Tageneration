import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:tageneration/ui/screens/user/user_model.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<UserViewModel>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(48.0),
                  child: Image.network(
                    'https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg',
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back',
                      style: GoogleFonts.inter(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      'Dwayne Johnson',
                      style: GoogleFonts.inter(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(48),
                  onTap: model.signOut,
                  child: Container(
                    width: 48,
                    alignment: Alignment.center,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFF494949),
                      ),
                      borderRadius: BorderRadius.circular(48.0),
                    ),
                    child: const Icon(
                      CupertinoIcons.pencil,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SlidingUpPanel(
            minHeight: 72,
            maxHeight: 216,
            parallaxEnabled: true,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            collapsed: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Column(
                  children: [
                    Container(
                      height: 8,
                      width: 56,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: const Color(0xFFC7C7C7)),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "Swipe Up to Open other method",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: const Color(0xFF191919),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            panel: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                color: Color(0xFFFFFFFF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 8,
                    width: 56,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xFFC7C7C7)),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Swipe Down to Сlose other method",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: const Color(0xFF191919),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(16.0),
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFD7F5F),
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFFD7F5F).withOpacity(0.4),
                                spreadRadius: 5,
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              )
                            ],
                          ),
                          child: const Icon(
                            Icons.facebook,
                            size: 30.0,
                            color: Color(0xFF191919),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            body: Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: const BoxDecoration(
                color: Color(0xFFFD7F5F),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              height: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE96847),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Icon(CupertinoIcons.device_phone_portrait),
                    ),
                    iconColor: const Color(0xFF333333),
                    title: const Text(
                      'Phone Number',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    subtitle: const Text(
                      '1',
                      style: TextStyle(
                        color: Color(0xFF994530),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
