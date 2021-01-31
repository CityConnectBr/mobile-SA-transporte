import 'package:cityconnect/models/cor_veiculo_model.dart';
import 'package:cityconnect/models/endereco_model.dart';
import 'package:cityconnect/models/marca_modelo_carroceria_model.dart';
import 'package:cityconnect/models/marca_modelo_chassi_model.dart';
import 'package:cityconnect/models/marca_modelo_veiculo_model.dart';
import 'package:cityconnect/models/permissionario_model.dart';
import 'package:cityconnect/models/tipo_combustivel_model.dart';
import 'package:cityconnect/models/tipo_veiculo_model.dart';
import 'package:intl/intl.dart';

class Veiculo {
  int id;
  String placa;
  String renavam;
  String chassi;
  int anoDeFabricacao;
  int anoDoModelo;
  String capacidade;
  String tipoDaCapacidade;
  String observacaoDaCapacidade;
  int anosDeVidaUtilDoVeiculo;
  //String prefixo;
  int categoriaId;
  //int marcaModeloCarroceriaId;
  //int marcaModeloChassiId;
  int marcaModeloVeiculoId;
  int tipoCombustivelId;
  int corId;
  int tipoVeiculoId;
  int permissionarioId;

  MarcaModeloCarroceria marcaModeloCarroceria;
  MarcaModeloChassi marcaModeloChassi;
  MarcaModeloVeiculo marcaModeloVeiculo;
  TipoCombustivel tipoCombustivel;
  TipoVeiculo tipoVeiculo;
  CorVeiculo corVeiculo;
  Permissionario permissionario;

  Veiculo();

  Veiculo.fromJson(Map<String, dynamic> parsedJson) {

    this.id = parsedJson["id"];
    this.placa = parsedJson["placa"];
    this.renavam = parsedJson["cod_renavam"];
    this.chassi = parsedJson["chassi"];
    this.anoDeFabricacao = parsedJson["ano_fabricacao"];
    this.anoDoModelo = parsedJson["ano_modelo"];
    this.capacidade = parsedJson["capacidade"];
    this.tipoDaCapacidade = parsedJson["tipo_capacidade"];
    this.observacaoDaCapacidade = parsedJson["observacao_capacidade"];
    this.anosDeVidaUtilDoVeiculo = parsedJson["anos_vida_util_veiculo"];
    //this.prefixo = parsedJson["prefixo"];
    this.categoriaId = parsedJson["categoria_id"];
    //this.marcaModeloCarroceriaId = parsedJson["marca_modelo_carroceria_id"];
    //this.marcaModeloChassiId = parsedJson["marca_modelo_chassi_id"];
    this.marcaModeloVeiculoId = parsedJson["marca_modelo_veiculo_id"];
    this.tipoCombustivelId = parsedJson["tipo_combustivel_id"];
    this.corId = parsedJson["cor_id"];
    this.tipoVeiculoId = parsedJson["tipo_veiculo_id"];
    this.permissionarioId = parsedJson["permissionario_id"];
    this.marcaModeloCarroceria = parsedJson["marca_modelo_carroceria"]!=null?MarcaModeloCarroceria.fromJson(parsedJson["marca_modelo_carroceria"]):null;
    this.marcaModeloChassi = parsedJson["marca_modelo_chassi"]!=null?MarcaModeloChassi.fromJson(parsedJson["marca_modelo_chassi"]):null;
    this.marcaModeloVeiculo = parsedJson["marca_modelo_veiculo"]!=null?MarcaModeloVeiculo.fromJson(parsedJson["marca_modelo_veiculo"]):null;
    this.tipoCombustivel = parsedJson["tipo_combustivel"]!=null?TipoCombustivel.fromJson(parsedJson["tipo_combustivel"]):null;
    this.tipoVeiculo = parsedJson["tipo_veiculo"]!=null?TipoVeiculo.fromJson(parsedJson["tipo_veiculo"]):null;
    this.corVeiculo = parsedJson["cor"]!=null?CorVeiculo.fromJson(parsedJson["cor"]):null;
    this.permissionario = parsedJson["permissionario"]!=null?Permissionario.fromJson(parsedJson["permissionario"]):null;
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "placa": placa,
      "cod_renavam": renavam,
      "chassi": chassi,
      "ano_fabricacao": anoDeFabricacao,
      "ano_modelo": anoDoModelo,
      "capacidade": capacidade,
      "tipo_capacidade": tipoDaCapacidade,
      "observacao_capacidade": observacaoDaCapacidade,
      "anos_vida_util_veiculo": anosDeVidaUtilDoVeiculo,
      //"prefixo": prefixo,
      "categoria_id": categoriaId,
      //"marca_modelo_carroceria_id": marcaModeloCarroceriaId,
      //"marca_modelo_chassi_id": marcaModeloChassiId,
      "marca_modelo_veiculo_id": marcaModeloVeiculoId,
      "tipo_combustivel_id": tipoCombustivelId,
      "cor_id": corId,
      "tipo_veiculo_id": tipoVeiculoId,
      "permissionario_id": permissionarioId,
    };
  }
}