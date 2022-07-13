import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/mensajes_response.dart';
import 'package:chat_app/models/usuarios.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatService with ChangeNotifier {
  Usuario? usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioId) async {
    final resp = await http.get(
      Uri.parse('${Environment.apiUrl}/mensajes/$usuarioId'),
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      },
    );

    final mensajeResp = mensajesResponseFromJson(resp.body);
    return mensajeResp.mensajes;
  }
}
