import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controller/controllerArticles.dart';
import '../../../domain/controller/controllerUser.dart';

class ListArticles extends StatelessWidget {
  const ListArticles({super.key});

  @override
  Widget build(BuildContext context) {
    ControlArticles controla = Get.find();
    ControlUser controlu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de Articulos"),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("/agregarArticulos");
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
        itemCount: controla.listaArticlesFinal!.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(controla.listaArticlesFinal![index].foto),
            ),
            title: Text(controla.listaArticlesFinal![index].detalle),
            subtitle: Text(controla.listaArticlesFinal![index].codigo),
            trailing: (controla.listaArticlesFinal![index].idUser ==
                    controlu.listaUserLogin![0].id)
                ? IconButton(
                    onPressed: () {
                      controla.listaArticlesFinal![0].idFinal = index;
                      Get.toNamed("/editararticle");
                    },
                    icon: const Icon(Icons.edit))
                : const Text(""),
          );
        },
      ),
    );
  }
}
