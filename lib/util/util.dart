import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Util {
  static final DateFormat dateFormatddMMyyyy = DateFormat("dd/MM/yyyy");
  static final DateFormat dateFormatddMMyyyyHHmm =
      DateFormat("dd/MM/yyyy 'às' HH:mm'h'");
  static final DateFormat dateFormatyyyyMMdd = DateFormat("yyyy-MM-dd");
  static final DateFormat dateFormatyyyyMMddTHHmmssZ =
      DateFormat('yyyy-MM-ddTHH:mm:ssZ');
  static final DateFormat timeFormatHHmm = DateFormat("HH:mm");
  static final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static String getRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

  static Map<String, dynamic> decodeJson(String string) {
    try {
      return json.decode(string);
    } catch (e) {
      return null;
    }
  }

  static String stringOnlyNumber(String value) {
    return value.replaceAll(" ", "").replaceAll(new RegExp('[^0-9]'), '');
  }

  static String convertyyyyMMddToddMMyyyy(String value) {
    return dateFormatddMMyyyy.format(dateFormatyyyyMMdd.parse(value));
  }

  static String convertddMMyyyyToyyyyMMdd(String value) {
    return dateFormatyyyyMMdd.format(dateFormatddMMyyyy.parse(value));
  }

  static String toStringIfIsNotNull(dynamic value) {
    try {
      return value != null ? value.toString() : null;
    } catch (e) {
      return null;
    }
  }

  static List<String> get UFs {
    return [
      "AC",
      "AL",
      "AP",
      "AM",
      "BA",
      "CE",
      "DF",
      "GO",
      "ES",
      "MA",
      "MT",
      "MS",
      "MG",
      "PA",
      "PB",
      "PR",
      "PE",
      "PI",
      "RJ",
      "RN",
      "RS",
      "RO",
      "RR",
      "SP",
      "SC",
      "SE",
      "TO"
    ];
  }

  static showDialogInfo(BuildContext context, String titulo, String texto) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              titulo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0, color: Theme.of(context).primaryColor),
            ),
            content: Text(texto),
            actions: <Widget>[
              new FlatButton(
                child: Text("Fechar"),
                onPressed: () {
                  //Navigator.pushNamed(context, "/screen1");
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  static showCustomDialog(BuildContext context, Widget dialog) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  static String clearString(String str) {
    return str != null
        ? str.replaceAll(RegExp(r'[.,-\/\\\[\]{}]'), "").replaceAll(" ", "")
        : null;
  }

  static Future<bool> needDownloadFile(File file) async {
    if (file != null &&
        await file.exists() &&
        (await file.lastModified())
            .isBefore(DateTime.now().add(Duration(minutes: -10)))) {
      return false;
    }

    return true;
  }

  static String formatStringToMoney(String value, {bool withSymbol = true}) {
    if (value == null) return null;

    value = value.replaceAll(".", "").replaceAll(",", ".");

    return NumberFormat.currency(
            locale: "pt_BR", symbol: withSymbol ? "R\$" : "", decimalDigits: 2)
        .format(double.parse(value));
  }

  static String formatMoneyToDouble(String value) {
    if (value == null) return null;

    value = value.replaceAll(",", ".");

    if (value.contains(".")) {
      //verificar se tem mais de 2 casas decimais
      if (value.split(".")[1].length > 2) {
        return value.split(".")[0] + "." + value.split(".")[1].substring(0, 2);
      } else if (value.split(".")[1].length == 1) {
        return value + "0";
      } else {
        return value;
      }
    } else {
      return value + ".00";
    }
  }

  static copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}

class Entry {
  Entry(this.title, this.subtitle, this.value,
      [this.children = const <Entry>[]]);

  final String title;
  final String subtitle;
  final String value;
  final List<Entry> children;
}

class DateUtil {
  //print(new DateFormat.yMMMd().format(new DateTime.now()));
  //static final

  static DateTime parseddMMyyyy(String date) {
    final f = new DateFormat('dd/MM/yyyy');

    return f.parse(date);
  }

  static String formatddMMyyyy(DateTime date) {
    final f = new DateFormat('dd/MM/yyyy');

    return f.format(date);
  }

  static String formatHHmm(DateTime date) {
    final f = new DateFormat('HH:mm');

    return f.format(date);
  }

  static DateTime yyyyMMddTHHmmssmmmToDate(String string) {
    final f = new DateFormat("yyyy-MM-ddTHH:mm:ss.SZ");
    return f.parse(string);
  }
}

class DeviceInfoUtil {
  static Future<String> getInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return "andoid:${androidInfo.androidId};${androidInfo.model};${androidInfo.device}";
    } catch (e) {}

    try {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return "ios:${iosInfo.identifierForVendor};${iosInfo.model};${iosInfo.name};${iosInfo.systemVersion}";
    } catch (e) {}

    return null;
  }
}
