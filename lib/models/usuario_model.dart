
class Usuario {
  late int id;
  late String nome;
  late String email;
  late String cpfCnpj;
  late String cnh;
  late String password;
  late TipoDoUsuario tipo;
}

class TipoDoUsuario{
  late int id;
  late String nome;

  TipoDoUsuario.fromJson(Map<String, dynamic> parsedJson){
    id = parsedJson["id"];
    nome = parsedJson["nome"];
  }

}