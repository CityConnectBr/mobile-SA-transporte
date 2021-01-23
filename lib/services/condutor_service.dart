import 'dart:io';

import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/models/usuario_model.dart';
import 'package:cityconnect/services/main_service.dart';
import 'package:cityconnect/util/util.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class CondutorService extends MainService {
  CondutorService() {
    super.endPoint = '/condutores';
    super.endPointVersion = 1;
  }

  Future<File> downloadPhoto(Condutor condutor, Usuario usuarioLogged) async {
    try {
      Response response = await dio.get(
        super.makeEndPoint(usuario: usuarioLogged, endPoint: "/condutores/${condutor.id}/foto", endPointVersion: 1),
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      Directory appDocDirectory = await getApplicationDocumentsDirectory();

      File file = File(appDocDirectory.path + '/condutores_${condutor.id}.jpg');

      if(await Util.needDownloadFile(file)){
        var raf = file.openSync(mode: FileMode.write);
        // response.data is List<int> type
        raf.writeFromSync(response.data);
        await raf.close();
      }

      if (await file.exists()) {
        return file;
      }
    } catch (e) {
      print(e);
    }
  }
}
