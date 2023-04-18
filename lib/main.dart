import 'package:easymir_application/UI%20presentation/home/views/home_page.dart';
import 'package:easymir_application/services/authentification.dart';
import 'package:easymir_application/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'UI presentation/login/views/login_page.dart';
import 'UI presentation/profile/views/profile.dart';

void main() async {
  //initialiser tous les widgets de l'app
  WidgetsFlutterBinding.ensureInitialized();
  //initialiser firebase dans l'app
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      StreamProvider.value(value: AuthServices().user, initialData: null)
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => Wrapper(),
        "/home": (context) => HomePage(),
        "/profile": (context) => Profile(),
      },
      debugShowCheckedModeBanner: false,
      title: 'EasyMir_App',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0d334b),
          ),
          textTheme:
              GoogleFonts.montserratTextTheme((Theme.of(context).textTheme))),
      initialRoute: "/",
    );
  }
}
