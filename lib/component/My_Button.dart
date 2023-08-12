import 'package:flutter/material.dart';

class MyButtom extends StatelessWidget {
  MyButtom(
      {required this.color, required this.onpressed, required this.tittle});
  final Color color;
  final String tittle;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: onpressed,
          minWidth: 200,
          height: 42,
          child: Text(tittle),
        ),
      ),
    );
  }
}
