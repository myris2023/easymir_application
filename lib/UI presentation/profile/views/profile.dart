import 'package:easymir_application/UI%20presentation/profile/widgets/appbar_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          AppBarProfile(
            user: _user,
          )
        ],
      )),
    );
  }
}
