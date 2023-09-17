
import 'package:sa_transportes_mobile/services/main_service.dart';

class MarcaModeloCarroceriaService extends MainService {
  MarcaModeloCarroceriaService() {
    super.endPoint = '/marcasmodeloscarrocerias';
    super.endPointVersion = 1;
  }
}
