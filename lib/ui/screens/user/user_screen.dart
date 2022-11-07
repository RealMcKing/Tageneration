import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tageneration/ui/screens/user/user_model.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<UserViewModel>();
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: const Color(0xFF03DABB),
                    width: 2.0,
                  ),
                ),
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    'https://i.stack.imgur.com/D8JWE.jpg',
                    height: 32,
                    width: 32,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text('User'),
              IconButton(
                onPressed: model.signOut,
                icon: const Icon(CupertinoIcons.location_fill),
              )
            ],
          )
        ],
      ),
    );
  }
}
