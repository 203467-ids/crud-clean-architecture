// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamingapp/features/videogames/domain/entities/videogame.dart';
import 'package:gamingapp/features/videogames/presentation/blocs/videogame_bloc.dart';
import 'package:gamingapp/features/videogames/presentation/pages/videogame_page.dart';

class UpdateVideoGame extends StatefulWidget {
  final VideoGame videoGame;
  const UpdateVideoGame({super.key, required this.videoGame});

  @override
  State<UpdateVideoGame> createState() => _UpdateVideoGameState();
}

class _UpdateVideoGameState extends State<UpdateVideoGame> {
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
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(134, 115, 57, 231))),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                hintText: widget.videoGame.name,
                                hintStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(149, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 35, bottom: 20),
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _realeaseYearGame,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(134, 115, 57, 231))),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                hintText:
                                    widget.videoGame.release_year.toString(),
                                hintStyle: const TextStyle(
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
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              134, 115, 57, 231))),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  hintText: widget.videoGame.developer,
                                  hintStyle: const TextStyle(
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
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(134, 115, 57, 231))),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                hintText: widget.videoGame.genre,
                                hintStyle: const TextStyle(
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
                                id: widget.videoGame.id,
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
                                    .add(UpdateGame(videoGame: videoGame));
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
                                        .add(UpdateGame(videoGame: videoGame));
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
                                const snackBar = SnackBar(
                                  content: Text(
                                      'No internet connection. Pending Changes.'),
                                  duration: Duration(days: 365),
                                );

                                print('ola');
                              }
                            }));
                            // BlocProvider.of<VideoGamesBlocModify>(context)
                            //     .add(UpdateGame(videoGame: videoGame));
                          },
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 250, 250, 250)),
                            'Actualizar',
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
