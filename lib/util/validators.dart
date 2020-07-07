
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class ValidatorsUtil{

  static final Pattern stringLowerCasePattern = "(?=.*[a-z])";
  static final Pattern stringUpperCasePattern = "(?=.*[A-Z])";
  static final Pattern numericPattern = "(?=.*[0-9])";
  static final Pattern minCharacterPattern = "(?=.{6,})";
  static final Pattern phonePattern = "^[0-9]{2}([0-9]{9}|[0-9]{8})";
  static final Pattern dateTimePattern = "^(\\d{4})-(\\d\\d)-(\\d\\d)T(\\d\\d):(\\d\\d):(\\d\\d).(\\d\\d\\d)Z\$";

  static String isNullOrIsEmpty(text) {
    if (text == null || text.isEmpty) return "Campo obrigatório";

    return null;
  }

  static String validatePassword(String value) {
    RegExp regex1 = new RegExp(numericPattern);
    RegExp regex2 = new RegExp(stringLowerCasePattern);
    RegExp regex3 = new RegExp(stringUpperCasePattern);
    RegExp regex4 = new RegExp(minCharacterPattern);
/*
    print("-----------");

    print("-- ${value}");
    print("1 ${!regex1.hasMatch(value)}");
    print("2 ${!regex2.hasMatch(value)}");
    print("3 ${!regex3.hasMatch(value)}");
    print("4 ${!regex4.hasMatch(value)}");
*/
    if ((!regex1.hasMatch(value) || (!regex2.hasMatch(value) && !regex3.hasMatch(value)) || !regex4.hasMatch(value)))
      return 'Senha inválida. Mínimo de 6 caracteres com letras e números.';
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

  static bool validateDateTime(String value) {
    RegExp regex = new RegExp(dateTimePattern);
    if (regex.hasMatch(value))
      return true;
    else
      return false;
  }

  static String validateIsEmpty(String value) {
    if (value == null || value.isEmpty)
      return 'Campo vazio';
    else
      return null;
  }

}
