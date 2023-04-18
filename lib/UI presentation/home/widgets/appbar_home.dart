import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  final User? user;
  const AppBarHome({this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('EasyMir'),
      floating: true,
      forceElevated: true,
      elevation: 0.8,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/profile"),
            child: CircleAvatar(
              backgroundColor: Color(0xFF0d334b),
              backgroundImage: NetworkImage(user!
                  .photoURL!), //l'user ne peut pas etre null et la photo aussi
            ),
          ),
        )
      ],
    );
  }
}
