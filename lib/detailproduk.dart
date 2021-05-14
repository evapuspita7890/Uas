import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite/ui/home.dart';

class DetailProduk extends StatefulWidget {
  DetailProduk(
      {Key key, this.name, this.description, this.price, this.image, this.star})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;
  final int star;
  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  final childrenstar = <Widget>[];
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < widget.star; i++) {
      childrenstar.add(new Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow,
      ));
    }
    return Scaffold(
      appBar: new AppBar(
          title: new Text("${widget.name}"),
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
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext) => Home(),
                    )))
          ]),
      body: new Container(
          width: double.infinity,
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Image.asset(
                    "assets/appimages/" + widget.image,
                    height: 400,
                    width: 300,
                  ),
                ],
              ),
              Container(
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [const Color(0xFFC8E6C9), const Color(0xFFA5D6A7)],
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: childrenstar,
                    ),
                    new Container(
                      child: new Text(
                        this.widget.price.toString(),
                        style: new TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: "NeoSansBold"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.green,
                width: double.infinity,
                height: double.maxFinite,
                child: new Text(widget.description),
              ),
            ],
          )),
    );
  }
}
