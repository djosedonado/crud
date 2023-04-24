class Articles {
  late int id;
  late String foto;
  late String detalle;
  late String codigo;
  late int idUser;
  late int idFinal;

  Articles(
      {required this.id,
      required this.foto,
      required this.detalle,
      required this.codigo,
      required this.idUser});

  factory Articles.desdeJson(Map<String, dynamic> jsonMap) {
    return Articles(
      id: int.parse(jsonMap['id']),
      foto: jsonMap['foto'],
      detalle: jsonMap['detalles'],
      codigo: jsonMap['codigo'],
      idUser: int.parse(jsonMap['idUser']),
    );
  }
}
