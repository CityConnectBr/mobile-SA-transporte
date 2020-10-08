
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';

class CustomInputAutocomplete extends StatefulWidget {
  @override
  _CustomInputAutocompleteState createState() => _CustomInputAutocompleteState();
}

class _CustomInputAutocompleteState extends State<CustomInputAutocomplete> {

  final people = <ObjectAutocomplete>[ObjectAutocomplete('Alice', '123 Main'), ObjectAutocomplete('Bob', '456 Main')];
  final letters = 'abcdefghijklmnopqrstuvwxyz'.split('');

  @override
  Widget build(BuildContext context) {
    return SimpleAutocompleteFormField<ObjectAutocomplete>(
      decoration: InputDecoration(
          labelText: 'Person', border: OutlineInputBorder()),
      suggestionsHeight: 80.0,
      itemBuilder: (context, person) => Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(person.title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(person.id)
            ]),
      ),
      onSearch: (search) async => people
          .where((person) =>
      person.title
          .toLowerCase()
          .contains(search.toLowerCase()) ||
          person.id
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList(),
      itemFromString: (string) => people.singleWhere(
              (person) => person.title.toLowerCase() == string.toLowerCase(),
          orElse: () => null),
      onChanged: (value) => print(value),
      onSaved: (value) => print(value),
      validator: (person) => person == null ? 'Invalid person.' : null,
    );
  }
}

class ObjectAutocomplete {
  ObjectAutocomplete(this.id, this.title);
  final String id, title;
  @override
  String toString() => title;
}