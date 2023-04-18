import 'package:easymir_application/services/authentification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //cette variable permet de contenir l'etat d'avancement de connexion avec google qui l'user va cliquer sur le bouton de connexion
  bool inLoginProcess = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenHWidth = MediaQuery.of(context).size.width;
    final ButtonStyle stylebutton = ElevatedButton.styleFrom(
        backgroundColor: Color(0xffe1c256),
        minimumSize: Size(screenHWidth * 0.7, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: const Color(0xFF0d334b),
            fontSize: 20,
            fontWeight: FontWeight.bold));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: screenHeight * 0.4,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('assets/images/easymir.png'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  width: screenHWidth,
                  height: screenHeight * 0.6,
                  decoration: const BoxDecoration(
                      color: Color(0xFF0d334b),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Text(
                                'HELLO! \nWelcome to \n_EasyMir_',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Divider(
                              color: Colors.white70,
                            ),
                            Text(
                              'Join our community to share this beautiful adventure with us: Lifestyle, Private talks, Task manager and many others.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            inLoginProcess
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                      color: Colors.red,
                                    ),
                                  )
                                : ElevatedButton.icon(
                                    icon: const Icon(
                                      Icons.login,
                                      size: 30,
                                      color: Color.fromARGB(255, 17, 17, 17),
                                    ),
                                    onPressed: () => signIn(),
                                    style: stylebutton,
                                    label: const Text('Login with Google'))
                          ]),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void signIn() {
    setState(() {
      inLoginProcess = true;
      //appeler une instance de classe authservice
      AuthServices().signInWithGoogle();
    });
  }
}
