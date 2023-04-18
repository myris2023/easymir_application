//nous permettra de faire basculer l'utilisateur sur la page de login s'il est connecté et surle login s'il ne l'est pas
import 'package:easymir_application/UI%20presentation/home/views/home_page.dart';
import 'package:easymir_application/UI%20presentation/login/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);
    return _user == null ? LoginPage() : HomePage();
  }
}
