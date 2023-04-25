import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../domain/models/articles.dart';
import '../../domain/models/utiles.dart';

class PeticionesArticles {
  static Future<List<Articles>> getListArticles() async {
    var url = Uri.parse(
        "https://crudarticulos.000webhostapp.com/APIARTICULOS/listarArticles.php");

    final response = await http.get(url);

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  static List<Articles> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    //print(pasar[0]['mensaje']);
    return pasar.map<Articles>((json) => Articles.desdeJson(json)).toList();
  }

  //agregar articles
  static Future<List<Mensajes>> registrarArticles(
      String foto, String detalle, String codigo, String idUser) async {
    var url = Uri.parse(
        "https://crudarticulos.000webhostapp.com/APIARTICULOS/agregarArticles.php");

    final response = await http.post(url,
        body: {'fotos': foto, 'detalles': detalle, 'codigos': codigo, 'iduser': idUser});

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista2, response.body);
  }

  static List<Mensajes> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['mensaje']);
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  // editar
  static Future<List<Mensajes>> editarArticles(
      String id, String f, String d, String c,String iduser) async {
    var url = Uri.parse(
        "https://crudarticulos.000webhostapp.com/APIARTICULOS/editarArticle.php");

    final response = await http
        .post(url, body: {'id': id, 'fotos': f, 'detalles': d, 'codigos': c,'iduser':iduser});

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista3, response.body);
  }

  static List<Mensajes> convertirAlista3(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['mensaje']);
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }
}
