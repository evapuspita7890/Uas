import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tentang",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: new ListView(
        children: <Widget>[
          Container(
            child: Image.asset(
              "assets/appimages/logo.png",
            ),
          ),
          Container(
            child: Text(
              "Layanan Aplikasi penyedia paket masakan",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
