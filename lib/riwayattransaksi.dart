import 'package:flutter/material.dart';

class RiwayatTransaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Text("Belum Ada Chat"),
      ),
      backgroundColor: Colors.green,
    );
  }
}
