![Dart Logo](https://dart.dev/assets/shared/dart-logo-for-shares.png)

# Tarea: Consumo de API y Manejo de Datos con Dart
El objetivo de esta tarea es poner en práctica tus habilidades en Dart realizando una solicitud HTTP a una API pública, transformando los datos recibidos en instancias de un modelo utilizando un constructor factory y almacenándolos  en una lista.

## Descripcion
Para este proyecto de gestion de informacion se ha usado la dependencia 'http' para poder realizar peticiones a la API pública de JSONPlaceholder `https://jsonplaceholder.typicode.com/users`. 

### Clases
 Se han creado el modelo para 4 clases existentes (User, Address, Geo y Company) todas con atributos, un constructor y un metodo 'factory' 'fromJson' que reciba los datos en formato Json y los devuelva como instancia de una clase. Ejemplo:

 ```dart
  class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.company,
      required this.phone,
      required this.website});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fronJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company']),
    );
  }
}
 ```

 ### Nota
 #### Adicionalmente se ha creado una clase 'UserController' que sirve para gestionar los datos de los usuarios
```dart
class UserController {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  UserController();

  Future<List<User>> solicitarUsuarios() async {
    {...}
  }

  List<User> filterUserEmail(List users) {
    {...}
  }

  List<User> filterUserbyName(List users) {
    {...}
  }
}
```
 * Funcion para solicitar datos: 
````dart
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
````
 * Funcion para filtrar los usuarios que pertenezcan al dominio 'biz': 
````dart
List<User> filterUserEmail(List users) {
    List<User> usersIn = [];

    for (int i = 0; i < users.length; i++) {
      if (users[i].email!.contains('biz')) {
        usersIn.add(users[i]);
      }
    }

    return usersIn;
  }
````
 * Funcion para filtrar los usuarios con username mayor a seis caracteres: 
````dart
List<User> filterUserbyName(List users) {
    List<User> usersOverSix = [];

    for (int i = 0; i < users.length; i++) {
      if (users[i].username!.length > 6) {
        usersOverSix.add(users[i]);
      }
    }

    return usersOverSix;
  }
````

## Ejecucion
Para ejecutar el programa, debe dirigirse a:
````shell 
/Peticiones_Http\bin 
````
Luego ejecutar el comando: 
````shell
dart main.dart
````

