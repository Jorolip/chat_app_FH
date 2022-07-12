import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/usuarios_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return const Center(
            child: Text('Espere...'),
          );
        },
      ),
    );
  }
}

Future checkLoginState(BuildContext context) async {
  final authService = Provider.of<AuthService>(context, listen: false);
  final autenticado = await authService.isLoggedIn();

  if (autenticado) {
    Navigator.pushReplacement(context,
        PageRouteBuilder(pageBuilder: (_, __, ___) => const UsuariosPage()));
  } else {
    Navigator.pushReplacement(context,
        PageRouteBuilder(pageBuilder: (_, __, ___) => const LoginPage()));
  }
}
