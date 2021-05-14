import 'package:flutter/material.dart';
import 'package:flutter_sqlite/ui/entryform.dart';
import 'package:flutter_sqlite/ui/entryform.dart';
import 'package:flutter_sqlite/models/contact.dart';
import 'package:flutter_sqlite/helpers/dbhelper.dart';
import 'package:flutter_sqlite/ui/home.dart';
import 'detailproduk.dart';

class ProdukList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Katalog"),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Click search');
            },
          ),
          IconButton(
            icon: Icon(Icons.camera_alt_outlined),
            onPressed: () {
              print('click search gambar');
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext) => Home(),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                        name: "Ayam Rica-Rica",
                        description:
                            "1 Paket terdiri dari ayam serta 1 paket bumbu ",
                        price: 15000,
                        image: "ayamrica1.jpeg",
                        star: 1,
                      )));
            },
            child: ProductBox(
              name: "Ayam Rica-rica",
              description: "Beli 2 Disc 5% + Free Paper Bag",
              price: 15000,
              image: "ayamrica.jpeg",
              star: 1,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                        name: "Bakso",
                        description:
                            "1 Paket terdiri dari pentol, mie, sayur kol, 1 peket bumbu",
                        price: 15000,
                        image: "bakso.jpeg",
                        star: 3,
                      )));
            },
            child: ProductBox(
              name: "Bakso",
              description: "Beli 2 Disc 5% + Free Paper Bag",
              price: 15000,
              image: "bakso1.jpeg",
              star: 3,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                        name: "Capcay",
                        description:
                            "1 Paket terdiri dari sayur kol, wortel, sayur hijau, bunga kol dan 1 paket bumbu masakan",
                        price: 10000,
                        image: "capcay.jpeg",
                        star: 5,
                      )));
            },
            child: ProductBox(
              name: "Capcay",
              description: "Beli 2 Disc 5% + Free Paper Bag",
              price: 10000,
              image: "capcay1.jpeg",
              star: 5,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                        name: "Sate",
                        description:
                            "1 paket terdiri dari 8 buah sate dan 1 paket bumbu masakan",
                        price: 10000,
                        image: "sate.jpeg",
                        star: 3,
                      )));
            },
            child: ProductBox(
              name: "Sate",
              description: "Beli 2 Disc 5% + Free Paper Bag",
              price: 10000,
              image: "sate1.jpeg",
              star: 3,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                        name: "Soto",
                        description:
                            "1 Paket terdiri dari sayur tauge, mie bihun, telur, daging ayan dan 1 paket bumbu masakan",
                        price: 13000,
                        image: "soto.jpeg",
                        star: 3,
                      )));
            },
            child: ProductBox(
              name: "Soto",
              description: "Beli 2 Disc 5% + Free Paper Bag",
              price: 13000,
              image: "soto1.jpeg",
              star: 3,
            ),
          )
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key key, this.name, this.description, this.price, this.image, this.star})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;
  final int star;
  final children = <Widget>[];
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < star; i++) {
      children.add(new Icon(
        Icons.star,
        size: 10,
        color: Colors.yellow,
      ));
    }
    return Container(
      padding: EdgeInsets.all(10),
      //height: 120
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              "assets/appimages/" + image,
              width: 85,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(this.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Text(this.description),
                      Text("Price: " + this.price.toString(),
                          style: TextStyle(color: Colors.green)),
                      Row(children: <Widget>[
                        Row(
                          children: children,
                        )
                      ])
                    ],
                  )),
            )
          ]),
    );
  }
}
