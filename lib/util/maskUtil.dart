import 'package:flutter_masked_text/flutter_masked_text.dart';

class MaskUtil {

  static final cpfMask = '000.000.000-00';
  static final cnpjMask = '00.000.000/0000-00';
  static final telefone8Mask = '00 0000-0000';
  static final telefone9Mask = '00 00000-0000';
  static final cepMask = '00000-000';
  static final dateMask = '00/00/0000';

  static final cpfMaskController = MaskedTextController(mask: cpfMask);
  static final cnpjMaskController = MaskedTextController(mask: cnpjMask);
  static final telefone8MaskController = MaskedTextController(mask: telefone8Mask);
  static final telefone9MaskController = MaskedTextController(mask: telefone9Mask);
  static final cepMaskController = MaskedTextController(mask: cepMask);
  static final dataMaskController = MaskedTextController(mask: dateMask);

  static MaskedTextController getMaskControllerWithValue({String mask, String value}){
    return MaskedTextController(mask: mask, text: value??"");
  }

  static MoneyMaskedTextController getMaskMoney({double value}){
    return MoneyMaskedTextController(leftSymbol: 'R\$ ', initialValue: value??0.0, precision: 2);
  }

}