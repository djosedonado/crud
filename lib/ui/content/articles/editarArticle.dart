
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/controller/controllerArticles.dart';
import '../../../domain/controller/controllerUser.dart';

class EditarArticulos extends StatelessWidget {
  const EditarArticulos({super.key});

  @override
  Widget build(BuildContext context) {
    ControlUser controlu = Get.find();
    ControlArticles controla = Get.find();
    TextEditingController foto = TextEditingController();
    TextEditingController detalle = TextEditingController();
    TextEditingController codigo = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Articles"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
      ),
      body:  SingleChildScrollView(
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
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    hintText: 'url',
                    hintStyle: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: detalle,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    hintText: 'detalle',
                    hintStyle: const TextStyle(color: Colors.black),
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
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    hintText: 'codigo',
                    hintStyle: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Registrarse',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            print(controlu.listaUserLogin![0].id.toString());
                            controla
                                .editarArticle(controla.listaArticlesFinal![controla.listaArticlesFinal![0].idFinal].id.toString(), foto.text, detalle.text, codigo.text,controla.listaArticlesFinal![controla.listaArticlesFinal![0].idFinal].idUser.toString())
                                .then((value) {
                              Get.snackbar(
                                  'Clientes', controlu.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor: Colors.yellow);
                            });
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
    );
  }
}