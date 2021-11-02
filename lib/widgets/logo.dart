import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, required this.titulo}) : super(key: key);
  final String titulo;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/tag-logo.png'),
              height: 100,
            ),
            Text(titulo, style: TextStyle(fontSize: 30))
          ],
        ),
      ),
    );
  }
}
