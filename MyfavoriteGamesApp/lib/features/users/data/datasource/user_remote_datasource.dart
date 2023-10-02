import '../../domain/entities/user.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<void> login(User user);
  Future<void> register(User user);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  String ip = '192.168.0.2:8000';

  @override
  Future<void> login(User user) async {
    var url = Uri.http(ip, '/api/v1/login/');
    var body = {'username': user.username, 'password': user.password};
    var headers = {'Content-Type': 'application/json'};
    // ignore: unused_local_variable
    var response =
        await http.post(url, body: convert.jsonEncode(body), headers: headers);
  }

  @override
  Future<void> register(User user) async {
    var url = Uri.http(ip, '/api/v1/register/');
    var body = {
      'first_name': user.firstName,
      'last_name': user.lastName,
      'username': user.username,
      'email': user.email,
      'password': user.password
    };
    var headers = {'Content-Type': 'application/json'};
    // ignore: unused_local_variable
    var response =
        await http.post(url, body: convert.jsonEncode(body), headers: headers);
  }
}
