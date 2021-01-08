
import 'package:cityconnect/services/main_service.dart';

class MarcaModeloVeiculoService extends MainService {
  MarcaModeloVeiculoService() {
    super.endPoint = '/marcasmodelosveiculos';
    super.endPointVersion = 1;
  }
}
