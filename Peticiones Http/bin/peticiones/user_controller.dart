import '../clases/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserController {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  UserController();

  Future<List<User>> solicitarUsuarios() async {
    // URL de la API

    // Realizar la petición GET
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Parsear la respuesta JSON a una lista
      List<dynamic> jsonData = json.decode(response.body);

      // Crear una lista de Post
      List<User> users = jsonData.map((json) => User.fromJson(json)).toList();

      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  List<User> filterUserEmail(List users) {
    List<User> usersIn = [];

    for (int i = 0; i < users.length; i++) {
      if (users[i].email!.contains('biz')) {
        usersIn.add(users[i]);
      }
    }

    return usersIn;
  }

  List<User> filterUserbyName(List users) {
    List<User> usersOverSix = [];

    for (int i = 0; i < users.length; i++) {
      if (users[i].username!.length > 6) {
        usersOverSix.add(users[i]);
      }
    }

    return usersOverSix;
  }
}
