import 'package:easymir_application/UI%20presentation/home/widgets/appbar_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarHome(
            user: _user,
          )
        ],
      ),
    );
  }
}
