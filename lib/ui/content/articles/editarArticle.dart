import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controller/controllerArticles.dart';
import '../../../domain/controller/controllerUser.dart';

class EditarArticles extends StatelessWidget {
  const EditarArticles({super.key});

  @override
  Widget build(BuildContext context) {
    ControlArticles controla = Get.find();
    ControlUser controlu = Get.find();
    TextEditingController foto = TextEditingController();
    TextEditingController detalles = TextEditingController();
    TextEditingController codigo = TextEditingController();
    foto.text = controla.listaArticlesFinal![controla.listaArticlesFinal![0].idFinal].foto;
    detalles.text = controla.listaArticlesFinal![controla.listaArticlesFinal![0].idFinal].detalle;
    codigo.text = controla.listaArticlesFinal![controla.listaArticlesFinal![0].idFinal].codigo;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.27),
              child: Column(children: [
                TextField(
                  controller: foto,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color.fromARGB(255, 12, 11, 11)),
                    ),
                    hintText: 'foto',
                    hintStyle: const TextStyle(color: Color.fromARGB(255, 7, 7, 7)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: detalles,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color.fromARGB(255, 5, 5, 5)),
                    ),
                    hintText: 'detalle',
                    hintStyle: const TextStyle(color: Color.fromARGB(255, 10, 9, 9)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: codigo,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color.fromARGB(255, 14, 13, 13)),
                    ),
                    hintText: 'codigo',
                    hintStyle: const TextStyle(color: Color.fromARGB(255, 10, 9, 9)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Editar ARTICULO',
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 10, 10),
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: const Color.fromARGB(255, 5, 5, 5),
                          onPressed: () {
                            controla
                                .editarArticle(controla.listaArticlesFinal![controla.listaArticlesFinal![0].idFinal].id.toString(),foto.text, detalles.text, codigo.text)
                                .then((value) {
                              Get.snackbar(
                                  'Clientes', controlu.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor: Colors.yellow);
                            });
                            controla.listArticles().then(
                                  (value) => Get.toNamed("/listarticles"));
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          'Inicio',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
