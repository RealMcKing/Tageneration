import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tageneration/ui/screens/auth/auth_model.dart';
import 'package:tageneration/ui/screens/auth/auth_screen.dart';

import 'package:tageneration/ui/screens/create_product/create_product_model.dart';
import 'package:tageneration/ui/screens/create_product/create_product_screen.dart';
import 'package:tageneration/ui/screens/loader/loader_model.dart';
import 'package:tageneration/ui/screens/loader/loader_screen.dart';

import 'package:tageneration/ui/screens/main/main_model.dart';
import 'package:tageneration/ui/screens/main/main_screen.dart';

import 'package:tageneration/ui/screens/product_list/product_list_model.dart';
import 'package:tageneration/ui/screens/product_list/product_list_screen.dart';

import 'package:tageneration/ui/screens/sign_in/sign_in_model.dart';
import 'package:tageneration/ui/screens/sign_in/sign_in_screen.dart';

import 'package:tageneration/ui/screens/sign_up/sign_up_model.dart';
import 'package:tageneration/ui/screens/sign_up/sign_up_screen.dart';
import 'package:tageneration/ui/screens/user/user_model.dart';
import 'package:tageneration/ui/screens/user/user_screen.dart';

class ScreenFactory {
  Widget makeProductList() {
    return ChangeNotifierProvider(
      create: (_) => ProductListViewModel(),
      child: const ProductListScreen(),
    );
  }

  Widget makeAddProduct() {
    return ChangeNotifierProvider(
      create: (_) => CreateProductViewModel(),
      child: const CreateProductScreen(),
    );
  }

  Widget makeSignIn() {
    return ChangeNotifierProvider(
      create: (_) => SignInViewModel(),
      child: const SignInScreen(),
    );
  }

  Widget makeAuth() {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: const AuthScreen(),
    );
  }

  Widget makeSignUp() {
    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(),
      child: const SignUpScreen(),
    );
  }

  Widget makeMain() {
    return ChangeNotifierProvider(
      create: (_) => MainViewModel(),
      child: const MainScreen(),
    );
  }

  Widget makeLoader() {
    return ChangeNotifierProvider(
      create: (_) => LoaderViewModel(),
      child: const LoaderScreen(),
    );
  }

  Widget makeUser() {
    return ChangeNotifierProvider(
      create: (_) => UserViewModel(),
      child: const UserScreen(),
    );
  }
}
