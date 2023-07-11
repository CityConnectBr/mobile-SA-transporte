
import 'package:sa_transportes_mobile/services/main_service.dart';

class PermissionarioService extends MainService {
  PermissionarioService() {
    super.endPoint = '/permissionarios';
    super.endPointVersion = 1;
  }

}
