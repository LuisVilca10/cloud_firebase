//import 'dart:developer';

//import 'package:firebase_2023_edteam/src/core/service/auth.dart';
//import 'package:firebase_2023_edteam/src/ui/pages/chats/chats_page.dart';
//import 'package:firebase_2023_edteam/src/ui/pages/forgot_password/forgot_password_page.dart';
//import 'package:firebase_2023_edteam/src/ui/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/core/service/auth.dart';
import 'package:flutter_firebase/src/ui/pages/chats/chats_page.dart';
//import 'package:flutter_firebase/src/ui/pages/chats/chats_page.dart';
import 'package:flutter_firebase/src/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:flutter_firebase/src/ui/pages/register/register_page.dart';

GlobalKey<ScaffoldMessengerState> loginKey =
    GlobalKey<ScaffoldMessengerState>();

class LoginPage extends StatefulWidget {
  static const route = 'login_page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController correoController;
  late TextEditingController contrasenaController;

  final auth = Auth();

  void iniciarSesion() async {
    String correo = correoController.text;
    String contrasena = contrasenaController.text;
    final response = await auth.login(correo, contrasena);
    if (response) {
      //if (!context.mounted) {
        Navigator.pushNamed(context, ChatListPage.route);
      //}
    }
  }

  @override
  void initState() {
    correoController = TextEditingController(text: '');
    contrasenaController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: loginKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Iniciar Sesión'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: correoController,
                  decoration: const InputDecoration(
                    labelText: 'Correo Electrónico',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: contrasenaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, RegistrationPage.route),
                    child: const Text('Registrarme'),
                  ),
                  ElevatedButton(
                    onPressed: iniciarSesion,
                    child: const Text('Iniciar Sesión'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, ForgotPasswordPage.route),
                child: const Text(
                  'Olvide mi contraseña',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}