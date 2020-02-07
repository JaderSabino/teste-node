import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

const request = "/jader";

void main() async {
  //var nome = await getData();

  BaseOptions options = new BaseOptions(
    //baseUrl: "http://192.168.100.48:3000",
    baseUrl: "http://10.0.2.2:3000",
    connectTimeout: 5000,
  );

  var dio = Dio(options);

  Response response = await dio.get(request);

  debugPrint(response.data.toString());

  runApp(MaterialApp(
    title: "Teste Node",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("teste"),
      ),
    );
  }
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}
