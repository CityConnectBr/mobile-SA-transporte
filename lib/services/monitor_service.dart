
import 'dart:io';

import 'package:cityconnect/models/monitor_model.dart';
import 'package:cityconnect/models/usuario_model.dart';
import 'package:cityconnect/services/main_service.dart';
import 'package:cityconnect/util/util.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class MonitorService extends MainService {
  MonitorService() {
    super.endPoint = '/monitores';
    super.endPointVersion = 1;
  }

  Future<File> downloadPhoto(Monitor monitor, Usuario usuarioLogged) async {
    try {
      print("downloadPhoto");

      Directory appDocDirectory = await getApplicationDocumentsDirectory();

      File file = File(appDocDirectory.path + '/monitores/${monitor.id}.jpg');

      //print(await Util.needDownloadFile(file));

      //if(await Util.needDownloadFile(file)){
      Response response = await dio.get(
        super.makeEndPoint(usuario: usuarioLogged, endPoint: "/monitores/${monitor.id}/foto", endPointVersion:  1),
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );

        var raf = file.openSync(mode: FileMode.write);
        // response.data is List<int> type
        raf.writeFromSync(response.data);
        await raf.close();
      //}
      print(super.makeEndPoint(usuario: usuarioLogged, endPoint: "/monitores/${monitor.id}/foto", endPointVersion:  1));
      print(await file.exists());

      if (await file.exists()) {
        return file;
      }
    } catch (e) {
      print(e);
    }
  }


}
