//import 'package:encrypt/encrypt.dart';

class SecurityUtil{

  static final String KEY_SHARED_PREF = "JplhnlOhxu^JGV&JpyO!fHDJ*8vZE!R3";

  //TODO: Criptografar e descriptografar
  static String encrypt(String plainText) {
    return plainText;
    //return Encrypter(AES(Key.fromUtf8(KEY_SHARED_PREF))).encrypt(plainText, iv: IV.fromLength(16)).base64;
  }

  //TODO: Criptografar e descriptografar
  static String dencrypt(String txt) {
    return txt;
    //return Encrypter(AES(Key.fromUtf8(KEY_SHARED_PREF))).decrypt64(txt, iv: IV.fromLength(16));
  }
}