import 'dart:io';

import 'package:sa_transportes_mobile/models/monitor_model.dart';
import 'package:sa_transportes_mobile/models/usuario_model.dart';
import 'package:sa_transportes_mobile/services/main_service.dart';
import 'package:sa_transportes_mobile/util/util.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class MonitorService extends MainService {
  MonitorService() {
    super.endPoint = '/monitores';
    super.endPointVersion = 1;
  }

  Future<File?> downloadPhoto(Monitor monitor, Usuario usuarioLogged) async {
    try {
      print("downloadPhoto");

      Directory appDocDirectory = await getApplicationDocumentsDirectory();

      File file = File(appDocDirectory.path + '/monitores_${monitor.id}.jpg');

      Response response = await dio.get(
        super.makeEndPoint(
            usuario: usuarioLogged,
            endPoint: "/monitores/${monitor.id}/foto",
            endPointVersion: 1),
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status != null && status < 500;
            }),
      );

      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();

      if (response.statusCode == 200 && await file.exists()) {
        return file;
      }
    } catch (e) {
      print(e);
    }
  }
}
