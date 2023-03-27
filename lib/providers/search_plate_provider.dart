import 'package:flutter/material.dart';
import 'package:satrans_new_app/services/veiculo_service.dart';

class SearchPlateProvider extends ChangeNotifier {
  final _veiculoService = VeiculoService();

  TextEditingController placaController = TextEditingController();

  bool? placaValida;

  Future<void> searchPlaca() async {
    placaValida = await _veiculoService
        .checkPlaca(placaController.text.replaceAll("-", "").trim());
    notifyListeners();
  }
}
