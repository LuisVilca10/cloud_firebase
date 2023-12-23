import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/src/ui/pages/chat/chat_page.dart';
import 'package:flutter_firebase/src/ui/pages/chats/chats_page.dart';
import 'package:flutter_firebase/src/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:flutter_firebase/src/ui/pages/login/login_page.dart';
import 'package:flutter_firebase/src/ui/pages/register/register_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica Chat',
      routes: {
        LoginPage.route: (context) => const LoginPage(),
        RegistrationPage.route: (context) => const RegistrationPage(),
        ForgotPasswordPage.route: (context) => const ForgotPasswordPage(),
        ChatListPage.route: (context) => const ChatListPage(),
        ChatPage.route: (context)=> const ChatPage('')
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LoginPage.route,
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final auth = FirebaseAuth.instance;

  late TextEditingController correoController;
  late TextEditingController contrasenaController;

  void iniciarSesion() async {
    String correo = correoController.text;
    String contrasena = contrasenaController.text;
    try {
      final respuesta = await auth.signInWithEmailAndPassword(
          email: correo, password: contrasena);
          if (respuesta.user!.emailVerified ==false) {
            log('usuario no verifica');
          } else{
            log('usuario correcto ${respuesta.user}');
          }
      log('Inicio de sesion correcto ${respuesta.user}');
    } catch (e) {
      log('El inicio de sesion no fue correcto, verifica tus credenciales');
    }
  }

  void crearCuenta() async {
    String correo = correoController.text;
    String contrasena = contrasenaController.text;
    try {
      final respuesta = await auth.createUserWithEmailAndPassword(email: correo, password: contrasena);
       await respuesta.user!.sendEmailVerification();
      log("message");
    } on FirebaseAuthException catch (e) {
      log("cuneta no creada");
      log(e.code);
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: correoController,
                  decoration: const InputDecoration(labelText: 'Correo'),
                ),
                TextField(
                  controller: contrasenaController,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: iniciarSesion,
                      child: const Text('Iniciar sesión'),
                    ),
                    OutlinedButton(
                      onPressed: crearCuenta,
                      child: const Text('Crear cuenta'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}*/
