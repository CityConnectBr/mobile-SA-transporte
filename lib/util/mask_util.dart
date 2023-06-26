import 'package:flutter_masked_text/flutter_masked_text.dart';

class MaskUtil {

  static const cpfMask = '000.000.000-00';
  static const cnpjMask = '00.000.000/0000-00';
  static const dddMask = '00';
  static const telefone8Mask = '0000-0000';
  static const telefone9Mask = '00000-0000';
  static const cepMask = '00000-000';
  static const dateMask = '00/00/0000';
  static const timeMask = '00:00';
  static const cnhMask = '00000000000';

  static MaskedTextController getMaskControllerWithValue({String mask, String value}){
    return MaskedTextController(mask: mask, text: value??"");
  }

  static MoneyMaskedTextController getMaskMoney({double value}){
    return MoneyMaskedTextController(leftSymbol: 'R\$ ', initialValue: value??0.0, precision: 2);
  }

}