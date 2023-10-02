import 'package:gamingapp/features/videogames/data/models/videogame.dart';
import 'package:gamingapp/features/videogames/domain/entities/videogame.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class VideoGameRemoteDataSource {
  Future<List<VideoGame>> getVideoGames();
  Future<void> addGames(List<VideoGame> videoGame);
  Future<void> deleteGame(VideoGame videoGame);
  Future<void> updateGame(VideoGame videoGame);
}

class VideoGameRemoteDataSourceImpl implements VideoGameRemoteDataSource {
  String ip = '192.168.55.166:4000';

  @override
  Future<List<VideoGame>> getVideoGames() async {
    var url = Uri.http(ip, '/videogames/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var returnData = convert
          .jsonDecode(response.body)
          .map<VideoGameModel>((data) => VideoGameModel.fromJson(data))
          .toList();
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('Response', response.body);
      return returnData;
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> addGames(List<VideoGame> videoGames) async {
    var url = Uri.http(ip, '/videogames/');
    var headers = {'Content-Type': 'application/json'};
    List<Map<String, String>> body = [];
    for (var videoGame in videoGames) {
      var gameObject = {
        "name": videoGame.name,
        "release_year": videoGame.release_year,
        "developer": videoGame.developer,
        "genre": videoGame.genre
      };
      body.add(gameObject);
    }
    print(body);
    await http.post(url, body: convert.jsonEncode(body[0]), headers: headers);
  }

  @override
  Future<void> deleteGame(VideoGame videoGame) async {
    var url = Uri.http(ip, '/videogames/${videoGame.id}');
    // ignore: unused_local_variable
    var response = await http.delete(url);
  }

  @override
  Future<void> updateGame(VideoGame videoGame) async {
    var url = Uri.http(ip, '/videogames/${videoGame.id}');
    var body = {
      'name': videoGame.name,
      'release_year': videoGame.release_year,
      'developer': videoGame.developer,
      'genre': videoGame.genre
    };
    var headers = {'Content-Type': 'application/json'};
    // ignore: unused_local_variable
    var response =
        await http.put(url, body: convert.jsonEncode(body), headers: headers);
  }
}
