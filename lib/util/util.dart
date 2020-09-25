import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';

class Util {

  static final DateFormat dateFormatddMMyyyy = DateFormat("dd/MM/yyyy");

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static String stringOnlyNumber(String value) {
    return value.replaceAll(" ", "").replaceAll(new RegExp('[^0-9]'), '');
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
    return str != null ? str.replaceAll(RegExp(r'[.,-\/\\\[\]{}]'), "") : null;
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
