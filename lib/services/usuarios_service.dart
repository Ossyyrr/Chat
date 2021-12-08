import 'package:chat/global/environment.dart';
import 'package:chat/models/usuario.dart';
import 'package:chat/models/usuario_response.dart';
import 'package:chat/services/auth_service.dart';
import 'package:http/http.dart' as http;

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp =
          await http.get(Uri.parse('${Environment.apiUrl}/usuarios'), headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken() ?? '',
      });

      final UsuariosResponse usuariosResponse =
          usuariosResponseFromJson(resp.body);
      return usuariosResponse.usuarios!;
    } catch (e) {
      return [];
    }
  }
}
