import 'package:flutter/material.dart';
import 'package:flutter_sqlite/about.dart';
import 'package:flutter_sqlite/chat.dart';
import 'package:flutter_sqlite/detailproduk.dart';
import 'package:flutter_sqlite/isianpemesanan.dart';
import 'package:flutter_sqlite/pemesanan.dart';
import 'package:flutter_sqlite/db_helper.dart';
import 'package:flutter_sqlite/pemesanan.dart';
import 'package:flutter_sqlite/ui/home.dart';
import 'package:flutter_sqlite/models/contact.dart';
import 'package:flutter_sqlite/belumbayar.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Beranda'),
              ]),
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
              icon: Icon(Icons.notifications_active),
              onPressed: () {
                print('click start');
              },
            ),
          ],
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                  accountName: new Text('Komang Eva Puspita Dewi'),
                  accountEmail: new Text('evapuspita789@gmail. com'),
                  currentAccountPicture: new GestureDetector(
                    onTap: () {},
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(
                          'https://lh3.googleusercontent.com/a-/AOh14Gj49KBYBJCI-qIaSacvbZ5tThJhKnvP1m9l0ekOoQ=s60-c-rg-br100'),
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/appimages/profile3.jpg'),
                        fit: BoxFit.cover),
                  )),
              new ListTile(
                  title: new Text('Pesan'),
                  trailing: new Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.green,
                  ),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext) => Home()))),
              new ListTile(
                  title: new Text('Chat'),
                  trailing: new Icon(
                    Icons.chat_bubble,
                    color: Colors.green,
                  ),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext) => Chat()))),
              Divider(
                height: 2,
              ),
              new ListTile(
                  title: new Text('About'),
                  trailing: new Icon(
                    Icons.info_outline_rounded,
                    color: Colors.green,
                  ),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext) => About()))),
            ],
          ),
        ),
        body: new ListView(children: <Widget>[
          Image.asset("assets/appimages/profile1.png"),
          Container(
            color: Colors.green[100],
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Masak Apa Saja Jadi Mudah',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'Rp 90.000',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.local_offer,
                  color: Colors.green[500],
                ),
                Text('Pesan Sekarang!'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.money_off_outlined, color: Colors.green),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Belum Bayar',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.shop_two, color: Colors.green),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Masih Proses',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.archive_sharp, color: Colors.green),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Riwayat Transaksi',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}
