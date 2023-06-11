import 'package:flutter/material.dart';

class BoxRounded extends StatelessWidget {
  final Widget child;

  const BoxRounded({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: child,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
