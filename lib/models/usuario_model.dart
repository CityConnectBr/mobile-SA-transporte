
class Usuario {

  int id;
  String nome;
  String email;
  String cpf;
  String cnh;
  String password;

  Usuario({int id, String nome, String email, String cpf, String cnh, String password}){
    this.id = id;
    this.nome = nome;
    this.email = email;
    this.cpf = cpf;
    this.cnh = cnh;
    this.password = password;
  }

  Usuario.fromJson(Map<String, dynamic> parsedJson){
    this.id = parsedJson["id"];
    this.nome = parsedJson["nome"];
    this.email = parsedJson["email"];
    this.cpf = parsedJson["CPF"];
    this.cnh = parsedJson["CNH"];
    //this.dataNasc = parsedJson["data_nasc"]!=null?DateTime.fromMicrosecondsSinceEpoch(parsedJson["data_nasc"].microsecondsSinceEpoch):null;
  }

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "nome": nome,
      "email": email,
      "CPF": cpf,
      "CNH": cnh,
    };
  }

}