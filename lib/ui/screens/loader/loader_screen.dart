import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:tageneration/domain/factory/screen_factory.dart';

class LoaderScreen extends StatelessWidget {
  static final _screenFactory = ScreenFactory();

  const LoaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _screenFactory.makeMain();
          } else {
            return _screenFactory.makeAuth();
          }
        },
      ),
    );
  }
}
