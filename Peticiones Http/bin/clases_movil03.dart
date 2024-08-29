import 'peticiones/user_controller.dart';
import 'clases/user.dart';
import 'dart:io';

void main() async {
  try {
    UserController controller = UserController();
    List<User> usuarios = await controller.solicitarUsuarios();
    bool finalizar = false;
    print('Bienvenido al Sistema de gestion de Usuarios');
    do {
      print('Opciones:');
      print('1-Mostrar Lista de Usuarios');
      print('2-Mostrar Usuarios con "username" mayor a 6');
      print('3-Mostrar Usuarios pertenecientes al dominio "biz"');
      print('4-Finalizar Ejecucion');
      int? opcion = leerOpcion();
      switch (opcion) {
        case 1:
          print('Lista de Usuarios');
          mostrarUsuarios(usuarios);
          print('- - - - - - - - -');
          break;

        case 2:
          List usersOver6 = controller.filterUserbyName(usuarios);
          print('Lista de Usuarios con "username" mayor a 6 Caracteres');
          mostrarUsuarios(usersOver6);
          print('- - - - - - - - -');
          break;

        case 3:
          List usersDom = controller.filterUserEmail(usuarios);
          mostrarUsuarios(usersDom);
          print('Lista de Usuarios pertenecientes al dominio "biz"');
          print('- - - - - - - - -');
          break;

        case 4:
          finalizar = true;
          break;

        default:
          print('Opcion no reconocida (X_X)');
      }
    } while (!finalizar);
    print('Ejecucion Finalizada');
  } catch (error) {
    print('Error: $error');
  }
}

int leerOpcion() {
  print('Seleccione una opcion: ');
  String? input = stdin.readLineSync();

  // Convertir la entrada a un número entero
  int? number = int.tryParse(input ?? '');

  if (number != null) {
    return number;
  } else {
    return leerOpcion();
  }
}

void mostrarUsuarios(List usuarios) {
  for (int i = 0; i < usuarios.length; i++) {
    User user = usuarios[i];
    print('- - - - - - - - -');
    print('Usuario ${i + 1}:');
    print('id: ${user.id}');
    print('name: ${user.name}');
    print('username: ${user.username}');
    print('email: ${user.email}');
    print('id: ${user.address.toString()}');
    print('phone: ${user.phone}');
    print('website: ${user.website}');
    print('comany: ${user.company.toString()}');
  }
}
