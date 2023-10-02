import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamingapp/features/videogames/domain/entities/videogame.dart';

import 'package:gamingapp/features/videogames/presentation/blocs/videogame_bloc.dart';
import 'package:gamingapp/features/videogames/presentation/pages/videogame_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateVideogame extends StatefulWidget {
  const CreateVideogame({super.key});

  @override
  State<CreateVideogame> createState() => _CreateVideogameState();
}

class _CreateVideogameState extends State<CreateVideogame> {
  TextEditingController _nameGame = TextEditingController();
  TextEditingController _realeaseYearGame = TextEditingController();
  TextEditingController _developerGame = TextEditingController();
  TextEditingController _genreGame = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agrega un nuevo juego'),
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
                              controller: _nameGame,
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
                                hintText: "NOMBRE",
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
                              controller: _realeaseYearGame,
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
                                hintText: "Año de salida",
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
                                controller: _developerGame,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              134, 115, 57, 231))),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  hintText: "Desarrolladora",
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(149, 0, 0, 0)),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 35, bottom: 20),
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _genreGame,
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
                                hintText: "Genero",
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
                            var videoGame = VideoGame(
                                id: 0,
                                name: _nameGame.text,
                                release_year: _realeaseYearGame.text,
                                developer: _developerGame.text,
                                genre: _genreGame.text);
                            await (Connectivity().checkConnectivity())
                                .then(((connectivityResult) async {
                              if (connectivityResult ==
                                  ConnectivityResult.wifi) {
                                print('Entro aqui');
                                List<VideoGame> videoGames = [];
                                BlocProvider.of<VideoGamesBlocModify>(context)
                                    .add(AddGames(videoGames: videoGames));
                                videoGames.add(videoGame);
                              } else {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                if (prefs.containsKey('addOffline')) {
                                  String? notesCache =
                                      prefs.getString('addOffline');
                                  prefs.remove('addOffline');
                                  if (notesCache != null) {
                                    List<dynamic> videogameList =
                                        json.decode(notesCache);
                                    List<VideoGame> videoGames = videogameList
                                        .map((map) => VideoGame.fromMap(map))
                                        .toList();
                                    BlocProvider.of<VideoGamesBlocModify>(
                                            context)
                                        .add(AddGames(videoGames: videoGames));
                                    videoGames.add(videoGame);
                                    List<Map<String, dynamic>> list = videoGames
                                        .map((videogame) => videogame.toMap())
                                        .toList();
                                    String game = json.encode(list);
                                    prefs.setString('addOffline', game);
                                  }
                                } else {
                                  List<VideoGame> videogames = [];
                                  videogames.add(videoGame);
                                  List<Map<String, dynamic>> list = videogames
                                      .map((videogame) => videogame.toMap())
                                      .toList();
                                  String encodedVideogames = json.encode(list);
                                  prefs.setString(
                                      'addOffline', encodedVideogames);
                                }
                                final BuildContext currentContext = context;
                                Future.microtask((() {
                                  Navigator.of(currentContext).pop();
                                  ScaffoldMessenger.of(currentContext)
                                      .clearSnackBars();
                                }));
                                // ignore: unused_local_variable
                                const snackBar = SnackBar(
                                  content: Text(
                                      'No internet connection. Pending Changes.'),
                                  duration: Duration(days: 365),
                                );

                                print('ola');
                              }
                            }));
                            // BlocProvider.of<VideoGamesBlocModify>(context)
                            //     .add(AddGames(videoGame: videoGame));
                          },
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 250, 250, 250)),
                            'Crear',
                          ),
                        ),
                        MaterialButton(
                          color: Color.fromARGB(255, 117, 203, 88),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => VideoGamePage()));
                          },
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 250, 250, 250)),
                            'REGRESAR',
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
