import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class ValidatorsUtil {
  static final Pattern numericPattern = "^[0-9]*\$";
  static final Pattern min6CharacterPattern = "(?=.{6,})";
  static final Pattern min1CharacterPattern = "(?=.{1,})";
  static final Pattern phonePattern = "^[0-9]{2}([0-9]{9}|[0-9]{8})\$";
  static final Pattern cepPattern = "^\\d{5}-\\d{3}\$";
  static final Pattern ufPattern =
      "^(AC|AL|AP|AM|BA|CE|DF|GO|ES|MA|MT|MS|MG|PA|PB|PR|PE|PI|RJ|RN|RS|RO|RR|SP|SC|SE|TO)\$";
  static final Pattern dateTimePattern =
      "^(\\d{4})-(\\d\\d)-(\\d\\d)T(\\d\\d):(\\d\\d):(\\d\\d).(\\d\\d\\d)Z\$";
  static final Pattern jwtPattern =
      "^[A-Za-z0-9-_=]+\.[A-Za-z0-9-_=]+\.?[A-Za-z0-9-_.+/=]*\$";

  static String isNullOrIsEmpty(text) {
    if (text == null || text.isEmpty) return "Campo obrigatório";

    return null;
  }

  static String validatePassword(String value) {
    //RegExp regex1 = new RegExp(numericPattern);
    //RegExp regex2 = new RegExp(stringLowerCasePattern);
    //RegExp regex3 = new RegExp(stringUpperCasePattern);
    RegExp regex4 = new RegExp(min6CharacterPattern);

    if (!regex4.hasMatch(value))
      return 'Senha inválida. Mínimo de 6 caracteres.';
    else
      return null;
  }

  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'E-mail inválido';
    else
      return null;
  }

  static String validateNumber(String value) {
    RegExp regex = new RegExp(numericPattern);
    if (!regex.hasMatch(value))
      return 'Número inválido';
    else
      return null;
  }

  static String validateNumberAndNotIsEmpty(String value) {
    if (value == null || value.isEmpty || !RegExp(numericPattern).hasMatch(value))
      return 'Número inválido';
    else
      return null;
  }

  static String validatePhone(String value) {
    RegExp regex = new RegExp(phonePattern);
    if (!regex.hasMatch(value))
      return 'Número inválido';
    else
      return null;
  }

  static String validateCPF(String value) {
    if (!CPFValidator.isValid(value))
      return 'CPF inválido';
    else
      return null;
  }

  static String validateDate(String value) {
    Pattern pattern = r'^\d{1,2}\/\d{1,2}\/\d{4}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Data inválida';
    else
      return null;
  }

  /*static bool validateDateTime(String value) {
    RegExp regex = new RegExp(dateTimePattern);
    if (!regex.hasMatch(value))
      return true;
    else
      return false;
  }*/

  static String validateIsEmpty(String value) {
    if (value == null || value.isEmpty)
      return 'Campo vazio';
    else
      return null;
  }

  static String validateOneCaracter(String value) {
    RegExp regex = new RegExp(min1CharacterPattern);
    if (!regex.hasMatch(value))
      return 'Campo inválido';
    else
      return null;
  }

  static String validateCEP(String value) {
    RegExp regex = new RegExp(cepPattern);
    if (!regex.hasMatch(value))
      return 'Campo inválido';
    else
      return null;
  }

  static String validateUF(String value) {
    RegExp regex = new RegExp(ufPattern);
    if (!regex.hasMatch(value.toUpperCase()))
      return 'UF não encontrado';
    else
      return null;
  }

  static String validateCPFCNPJ(String value) {
    if (value == null || value.isEmpty)
      return 'Campo vazio';
    else if (value.length <= 14) {
      //14 somando . e -
      CPFValidator.isValid("999.999.999-99");
    } else {
      CNPJValidator.isValid("99.999.999/9999-99");
    }
  }
}
