import 'package:sa_transportes_mobile/util/util.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<String>? dropdownValues;
  final Text? hint;
  final Function? onChanged;
  final String? value;
  final String? label;

  CustomDropdown(
      {required this.dropdownValues,
      this.hint,
      this.onChanged,
      this.value,
      this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  label!,
                  style: TextStyle(
                    color: Util.hexToColor("#4A4A4A"),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Container(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          height: 57.0,
          decoration: BoxDecoration(
            color: Util.hexToColor("#F7F8F9"),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: Util.hexToColor("#e3e3e3"),
                style: BorderStyle.solid,
                width: 1.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              items: dropdownValues != null
                  ? dropdownValues!
                      .map((value) => DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          ))
                      .toList()
                  : null,
              onChanged: onChanged != null
                  ? onChanged as void Function(String?)?
                  : null,
              isExpanded: false,
              value: value != null && value!.isNotEmpty ? value : null,
              hint: hint,
            ),
          ),
        )
      ],
    );
  }
}
