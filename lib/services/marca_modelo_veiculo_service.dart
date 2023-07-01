
import 'package:sa_transportes_mobile/services/main_service.dart';

class MarcaModeloVeiculoService extends MainService {
  MarcaModeloVeiculoService() {
    super.endPoint = '/marcasmodelosveiculos';
    super.endPointVersion = 1;
  }
}
