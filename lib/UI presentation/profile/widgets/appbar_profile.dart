import 'package:easymir_application/services/authentification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class AppBarProfile extends StatelessWidget {
  final User? user;

  const AppBarProfile({this.user, super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenHWidth = MediaQuery.of(context).size.width;
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: screenHeight * 0.4,
      pinned:
          true, // pour fixer appbar en hauteur, que ca ne scrolle pas avec les autres widgets
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
              color: Color(0xFF0d334b),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              image: DecorationImage(
                  image: NetworkImage(user!.photoURL!),
                  fit: BoxFit
                      .cover) // ! specifie que l'image et l'user ne peut pas etre nulle
              ),
          //creation d'un degradé afin de permettre aux textes d'etre mieux visibles
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 69, 131, 161),
                  Colors.transparent
                ], begin: Alignment.bottomRight)),
          ),
        ),
        titlePadding: EdgeInsets.only(left: screenHWidth * 0.1, bottom: 9),
        title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: '${user!.displayName}\n',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white)),
              TextSpan(
                  text: '${user!.email}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white70))
            ])),
      ),
      actions: [
        IconButton(
            onPressed: () => signOut(context),
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ))
      ],
    );
  }

  void signOut(BuildContext context) {
    Navigator.pop(context);
    AuthServices().signOut();
  }
}
