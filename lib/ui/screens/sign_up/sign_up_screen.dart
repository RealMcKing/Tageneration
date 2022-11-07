import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:tageneration/ui/screens/sign_up/sign_up_model.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpViewModel>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You're welcome",
                      style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      cursorRadius: Radius.circular(2),
                      cursorColor: Color(0xFFA0A7BA),
                      style: TextStyle(
                        color: Color(0xFFA0A7BA),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      obscureText: model.isObscure,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      cursorRadius: const Radius.circular(2),
                      cursorColor: const Color(0xFFA0A7BA),
                      style: const TextStyle(
                        color: Color(0xFFA0A7BA),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          splashRadius: 8.0,
                          icon: Icon(
                            model.isObscure
                                ? CupertinoIcons.eye_slash_fill
                                : CupertinoIcons.eye_fill,
                            color: const Color(0xFFA0A7BA),
                          ),
                          onPressed: model.visibility,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      obscureText: model.isObscure,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      cursorRadius: const Radius.circular(2),
                      cursorColor: const Color(0xFFA0A7BA),
                      style: const TextStyle(
                        color: Color(0xFFA0A7BA),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          splashRadius: 8.0,
                          icon: Icon(
                            model.isObscure
                                ? CupertinoIcons.eye_slash_fill
                                : CupertinoIcons.eye_fill,
                            color: const Color(0xFFA0A7BA),
                          ),
                          onPressed: model.visibility,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFD7F5F),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.inter(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF191919),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 160.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
