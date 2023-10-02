import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamingapp/features/users/domain/entities/user.dart';
import 'package:gamingapp/features/users/presentation/blocs/user_bloc.dart';

import 'package:gamingapp/features/videogames/presentation/pages/videogame_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
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
                              controller: _firstName,
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
                                hintText: "Primer nombre",
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
                              controller: _lastName,
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
                                hintText: "Apellido",
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
                              controller: _email,
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
                                hintText: "correo",
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
                                firstName: _firstName.text,
                                lastName: _lastName.text,
                                username: _username.text,
                                email: _email.text,
                                password: _password.text);

                            BlocProvider.of<UserAuthentication>(context)
                                .add(Register(user: user));

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
                            'Crear cuenta',
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
