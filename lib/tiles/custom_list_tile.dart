import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String? title;
  final Function()? onTap;

  CustomListTile({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 32.0,
      ),
      child: Container(
        child: InkWell(
          splashColor: Color.fromARGB(150, 45, 156, 219),
          onTap: onTap,
          child: Container(
            height: 40.0,
            child: Row(
              children: <Widget>[
                Text(
                  title ?? "",
                  style: TextStyle(
                    fontFamily: "InterBold",
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
