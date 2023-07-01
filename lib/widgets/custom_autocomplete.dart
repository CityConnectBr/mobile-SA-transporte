import 'package:sa_transportes_mobile/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class InputAutocomplete extends StatefulWidget {
  final String? hint;
  final String? label;
  final Function? searchCallback;
  final Function? setSelected;
  final TextEditingController? controller;

  InputAutocomplete({this.label, this.searchCallback, this.setSelected, this.hint, this.controller});

  @override
  _InputAutocompleteState createState() =>
      _InputAutocompleteState(label: label, searchCallback: searchCallback, setSelected: setSelected, hint: this.hint, controller: controller);
}

class _InputAutocompleteState extends State<InputAutocomplete> {
  final String? hint;
  final String? label;
  final Function? searchCallback;
  final Function? setSelected;
  final TextEditingController? controller;

  _InputAutocompleteState({this.label, this.searchCallback, this.setSelected, this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
            controller: controller,
            style: TextStyle(color: Util.hexToColor("#444444"), fontSize: 18.0),
            decoration: InputDecoration(
              filled: true,
              //fillColor: (this.enabled) ? Util.hexToColor("#F7F8F9") : Colors.grey[200],
              hintText: hint,
              labelText: label,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              errorText: null,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Util.hexToColor("#c3c3c3"), width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Util.hexToColor("#e3e3e3"), width: 1.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
            )),
        suggestionsCallback: (pattern) async {
          return searchCallback != null ? await searchCallback!(pattern) : null;
        },
        itemBuilder: (context, suggestion) {
          if (suggestion != null) {
            final s = Suggestion.byDynamic(suggestion);
            return ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text(s.description),
            );
          }

          return Container();
        },
        onSuggestionSelected: (dynamic suggestion) {
          if (suggestion != null) {
            if (this.controller != null) {
              controller!.text = suggestion.description;
            }

            if (this.setSelected != null) {
              this.setSelected!(suggestion);
            }
          }
        },
      ),
    );
  }
}

class Suggestion {
  String id;
  String description;

  Suggestion(this.id, this.description);
  Suggestion.byDynamic(dynamic suggestion) : this(suggestion["id"], suggestion["description"]);
}
