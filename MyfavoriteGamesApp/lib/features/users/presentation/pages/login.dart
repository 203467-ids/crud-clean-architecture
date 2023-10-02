import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamingapp/features/users/domain/entities/user.dart';
import 'package:gamingapp/features/users/presentation/blocs/user_bloc.dart';
import 'package:gamingapp/features/users/presentation/pages/register.dart';

import 'package:gamingapp/features/videogames/presentation/pages/videogame_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicia sesion'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 35, bottom: 20),
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _username,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(134, 115, 57, 231))),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                hintText: "Nombre de usuario",
                                hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(149, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35, bottom: 20),
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _password,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(134, 115, 57, 231))),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                hintText: "Ingrese su contraseña",
                                hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(149, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          color: Color.fromARGB(255, 117, 203, 88),
                          onPressed: () async {
                            var user = User(
                                id: 0,
                                firstName: 'firstName',
                                lastName: 'lastName',
                                username: _username.text,
                                email: 'email',
                                password: _password.text);

                            BlocProvider.of<UserAuthentication>(context)
                                .add(Login(user: user));

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const VideoGamePage()));
                          },
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 250, 250, 250)),
                            'Iniciar sesion',
                          ),
                        ),
                        MaterialButton(
                          color: Color.fromARGB(255, 117, 203, 88),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const RegisterPage()));
                          },
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 250, 250, 250)),
                            'Crear una cuenta nueva',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
