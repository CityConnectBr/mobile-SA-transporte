import 'dart:io';

import 'package:sa_transportes_mobile/models/condutor_model.dart';
import 'package:sa_transportes_mobile/models/usuario_model.dart';
import 'package:sa_transportes_mobile/services/main_service.dart';
import 'package:path_provider/path_provider.dart';

class CondutorService extends MainService {
  CondutorService() {
    super.endPoint = '/condutores';
    super.endPointVersion = 1;
  }

  Future<File?> downloadPhoto(Condutor condutor, Usuario usuarioLogged) async {
    final url = super.makeEndPoint(
        usuario: usuarioLogged,
        endPoint: "/condutores/${condutor.id}/foto",
        endPointVersion: 1);

    final file = new File(
        "${(await getTemporaryDirectory()).path}/condutor_${condutor.id}.jpg");

    await download(url: url, file: file);

    if (await file.exists()) {
      return file;
    }
  }
}
