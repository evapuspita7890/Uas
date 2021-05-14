import 'package:flutter/material.dart';

class Pemesanan {
  int id;
  String name;

  Pemesanan(this.id, this.name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
    };
    return map;
  }

  Pemesanan.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
