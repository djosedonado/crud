import '../../data/services/peticionesArticles.dart';
import '../models/articles.dart';
import '../models/utiles.dart';
import 'package:get/get.dart';

class ControlArticles extends GetxController {
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<Articles>> listaArticle = Rxn<List<Articles>>([]);

  Future<void> listArticles() async {
    listaArticle.value = await PeticionesArticles.getListArticles();
  }

  Future<void> registarArticle(String f, String d, String c,String idUser) async {//metodo agrgar
    _listarMensajes.value = await PeticionesArticles.registrarArticles(f, d, c,idUser);
  }


  Future<void> editarArticle(String id,String f, String d, String c) async {
    _listarMensajes.value = await PeticionesArticles.editarArticles(id,f, d, c);
  }

  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<Articles>? get listaArticlesFinal => listaArticle.value;
}
