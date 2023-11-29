
import 'package:sa_transportes_mobile/models/cor_veiculo_model.dart';
import 'package:sa_transportes_mobile/models/marca_modelo_carroceria_model.dart';
import 'package:sa_transportes_mobile/models/marca_modelo_chassi_model.dart';
import 'package:sa_transportes_mobile/models/marca_modelo_veiculo_model.dart';
import 'package:sa_transportes_mobile/models/permissionario_model.dart';
import 'package:sa_transportes_mobile/models/tipo_combustivel_model.dart';
import 'package:sa_transportes_mobile/models/tipo_veiculo_model.dart';
import 'dart:developer' as dev;

class Veiculo {
  int? id;
  String? placa;
  String? renavam;
  String? chassi;
  int? anoDeFabricacao;
  int? anoDoModelo;
  String? capacidade;
  String? tipoDaCapacidade;
  String? observacaoDaCapacidade;
  int? anosDeVidaUtilDoVeiculo;
  String? descricao;
  int? categoriaId;
  int? marcaModeloVeiculoId;
  int? tipoCombustivelId;
  int? corId;
  int? tipoVeiculoId;
  int? permissionarioId;

  MarcaModeloCarroceria? marcaModeloCarroceria;
  MarcaModeloChassi? marcaModeloChassi;
  MarcaModeloVeiculo? marcaModeloVeiculo;
  TipoCombustivel? tipoCombustivel;
  TipoVeiculo? tipoVeiculo;
  CorVeiculo? corVeiculo;
  Permissionario? permissionario;

  Veiculo();

  Veiculo.fromJson(Map<String, dynamic> parsedJson) {
     // dev.debugger();
    id = parsedJson["id"];
    placa = parsedJson["placa"];
    renavam = parsedJson["cod_renavam"];
    chassi = parsedJson["chassi"];
    anoDeFabricacao = parsedJson["ano_fabricacao"];
    anoDoModelo = parsedJson["ano_modelo"];
    capacidade = parsedJson["capacidade"];
    tipoDaCapacidade = parsedJson["tipo_capacidade"];
    observacaoDaCapacidade = parsedJson["observacao_capacidade"];
    anosDeVidaUtilDoVeiculo = parsedJson["anos_vida_util_veiculo"];
    //this.prefixo = parsedJson["prefixo"];
    categoriaId = parsedJson["categoria_id"];
    //this.marcaModeloCarroceriaId = parsedJson["marca_modelo_carroceria_id"];
    //this.marcaModeloChassiId = parsedJson["marca_modelo_chassi_id"];
    marcaModeloVeiculoId = parsedJson["marca_modelo_veiculo_id"];
    tipoCombustivelId = parsedJson["tipo_combustivel_id"];
    corId = parsedJson["cor_id"];
    tipoVeiculoId = parsedJson["tipo_veiculo_id"];
    permissionarioId = parsedJson["permissionario_id"];
    marcaModeloCarroceria = parsedJson["marca_modelo_carroceria"]!=null?MarcaModeloCarroceria.fromJson(parsedJson["marca_modelo_carroceria"]):null;
    marcaModeloChassi = parsedJson["marca_modelo_chassi"]!=null?MarcaModeloChassi.fromJson(parsedJson["marca_modelo_chassi"]):null;
    marcaModeloVeiculo = parsedJson["marca_modelo_veiculo"]!=null?MarcaModeloVeiculo.fromJson(parsedJson["marca_modelo_veiculo"]):null;
    tipoCombustivel = parsedJson["tipo_combustivel"]!=null?TipoCombustivel.fromJson(parsedJson["tipo_combustivel"]):null;
    tipoVeiculo = parsedJson["tipo_veiculo"]!=null?TipoVeiculo.fromJson(parsedJson["tipo_veiculo"]):null;
    corVeiculo = parsedJson["cor"]!=null?CorVeiculo.fromJson(parsedJson["cor"]):null;
    permissionario = parsedJson["permissionario"]!=null?Permissionario.fromJson(parsedJson["permissionario"]):null;
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