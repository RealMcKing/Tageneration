import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:tageneration/domain/factory/screen_factory.dart';
import 'package:tageneration/ui/screens/auth/auth_model.dart';

class AuthScreen extends StatelessWidget {
  static final _screenFactory = ScreenFactory();

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Color(0xFF191919),
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: const EdgeInsets.only(
                  bottom: 4.0,
                  left: 2.0,
                  right: 2.0,
                ),
                labelColor: const Color(0xFFE96847),
                unselectedLabelColor: const Color(0xFFE96847),
                indicatorColor: const Color(0xFFE96847),
                labelStyle: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                isScrollable: true,
                tabs: const [
                  Tab(child: Text('Sign In')),
                  Tab(child: Text('Sign Up')),
                ],
              )
            ],
          ),
        ),
        body: SlidingUpPanel(
          minHeight: 72,
          maxHeight: 160,
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
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
                  "Swipe Down to Close other method",
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
                    const GoogleSignInWidget(),
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
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              _screenFactory.makeSignIn(),
              _screenFactory.makeSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthViewModel>();
    return InkWell(
      borderRadius: BorderRadius.circular(16.0),
      onTap: () => model.createGoogleAccount(context),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: const Color(0xFFD5EDAD),
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFD5EDAD).withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ] // changes position of shadow)],
            ),
        child: const Icon(
          Icons.apple,
          size: 30.0,
          color: Color(0xFF191919),
        ),
      ),
    );
  }
}
