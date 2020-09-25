import 'package:cityconnect/models/condutor_model.dart';
import 'package:cityconnect/models/endereco_model.dart';
import 'package:cityconnect/screen/permissionario/condutor_screen.dart';
import 'package:cityconnect/services/condutor_service.dart';
import 'package:cityconnect/stores/usuario_store.dart';
import 'package:cityconnect/util/error_handler_util.dart';
import 'package:cityconnect/widgets/snack_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'condutor_store.g.dart';

class CondutorStore = _CondutorStore with _$CondutorStore;

abstract class _CondutorStore with Store {
  @observable
  bool loading = false;

  Condutor _condutor;

  final _condutorService = CondutorService();

  String _lastSearch;

  @observable
  List<Condutor> condutores;

  @action
  Future<void> pesquisarCondutores(
      {String search,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      this._lastSearch = search;

      assert(await Provider.of<UsuarioStore>(context, listen: false)
          .isLoggedInWithRedirect(
              context: context, redirectToHomeIfLogged: false));

      condutores = await _condutorService.search(search);

      if (condutores == null) {
        condutores = [];
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());

      condutores = [];
    }

    loading = false;
  }

  @action
  Future<void> firstLoadList(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await Provider.of<UsuarioStore>(context, listen: false)
          .isLoggedInWithRedirect(
              context: context, redirectToHomeIfLogged: false));

      if (this.condutores == null) {
        this.condutores = await this._condutorService.search("");
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> newCondutor(
      {@required BuildContext context,
      @required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      assert(await Provider.of<UsuarioStore>(context, listen: false)
          .isLoggedInWithRedirect(
              context: context, redirectToHomeIfLogged: false));

      this._condutor = Condutor();

      dynamic returnFromScreen = await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => CondutorScreen(this._condutor)));

      if (returnFromScreen != null && returnFromScreen) {
        SnackMessages.showSnackBarSuccess(
            context, scaffoldKey, "Salvo com sucesso");

        this.pesquisarCondutores(
            scaffoldKey: scaffoldKey, context: context, search: _lastSearch);
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
  }

  @action
  Future<void> editCondutor(
      {@required Condutor condutor,
      @required BuildContext context,
      @required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      assert(await Provider.of<UsuarioStore>(context, listen: false)
          .isLoggedInWithRedirect(
              context: context, redirectToHomeIfLogged: false));

      this._condutor = condutor;

      dynamic returnFromScreen = await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => CondutorScreen(this._condutor)));

      if (returnFromScreen != null && returnFromScreen) {
        SnackMessages.showSnackBarSuccess(
            context, scaffoldKey, "Salvo com sucesso");

        this.pesquisarCondutores(
            scaffoldKey: scaffoldKey,
            context: context,
            search: this._lastSearch);
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }
  }

  @action
  Future<void> save(
      {String nome,
      String email,
      String cpf,
      String rg,
      String naturalidade,
      String nacionalidade,
      DateTime dataNascimento,
      String ddd,
      String telefone,
      String celular,
      String cnh,
      String categoriaCNH,
      DateTime vencimentoCNH,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await Provider.of<UsuarioStore>(context, listen: false)
          .isLoggedInWithRedirect(
              context: context, redirectToHomeIfLogged: false));

      bool aux = true;
      if (categoriaCNH == null || categoriaCNH.isEmpty) {
        aux = false;
        SnackMessages.showSnackBarError(
            context, scaffoldKey, "Categoria da CNH não pode estar vazio.");
      }

      if (this._condutor.endereco == null ||
          this._condutor.endereco.cep == null) {
        SnackMessages.showSnackBarError(
            context, scaffoldKey, "Aba endereços esta vazia ou não esta salva");
      }

      if (aux) {
        this._condutor.nome = nome;
        this._condutor.email = email;
        this._condutor.rg = rg;
        this._condutor.cpf = cpf;
        this._condutor.naturalidade = naturalidade;
        this._condutor.nacionalidade = nacionalidade;
        this._condutor.dataNascimento = dataNascimento;
        this._condutor.ddd = ddd;
        this._condutor.telefone = telefone;
        this._condutor.celular = celular;
        this._condutor.cnh = cnh;
        this._condutor.categoriaCNH = categoriaCNH;
        this._condutor.vencimentoCNH = vencimentoCNH;

        await saveCondutor(context: context, scaffoldKey: scaffoldKey);
      }
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  @action
  Future<void> saveEndereco(
      {String cep,
      String endereco,
      String numero,
      String complemento,
      String bairro,
      String municipio,
      String uf,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    loading = true;

    try {
      assert(await Provider.of<UsuarioStore>(context, listen: false)
          .isLoggedInWithRedirect(
              context: context, redirectToHomeIfLogged: false));

      if (this._condutor.endereco == null) {
        this._condutor.endereco = Endereco();
      }

      this._condutor.endereco.cep = cep;
      this._condutor.endereco.endereco = endereco;
      this._condutor.endereco.numero = numero;
      this._condutor.endereco.complemento = complemento;
      this._condutor.endereco.bairro = bairro;
      this._condutor.endereco.municipio = municipio;
      this._condutor.endereco.uf = uf;

      await saveCondutor(context: context, scaffoldKey: scaffoldKey);
    } catch (e) {
      SnackMessages.showSnackBarError(
          context, scaffoldKey, ErrorHandlerUtil(e).getMessegeToUser());
    }

    loading = false;
  }

  Future<void> saveCondutor(
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) async {
    if (this._condutor.id == null || this._condutor.id.toString().isEmpty) {
      if ((await _condutorService.create(this._condutor) != null)) {
        Navigator.of(context).pop(true);
      }
    } else {
      if (await _condutorService.update(this._condutor)) {
        Navigator.of(context).pop(true);
      }
    }
  }
}
