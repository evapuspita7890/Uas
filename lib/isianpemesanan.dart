import 'package:flutter/material.dart';
import 'package:flutter_sqlite/db_helper.dart';
import 'package:flutter_sqlite/pemesanan.dart';

class PemesananPage extends StatefulWidget {
  @override
  _PemesananPageState createState() => _PemesananPageState();
}

class _PemesananPageState extends State<PemesananPage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Future<List<Pemesanan>> pemesanans;
  String _pemesananName;
  bool isUpdate = false;
  int pemesananIdForUpdate;
  DBHelper dbHelper;
  final _pemesananNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshPemesananList();
  }

  refreshPemesananList() {
    setState(() {
      pemesanans = dbHelper.getPemesanans();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: Text('Form Pemesanan'),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formStateKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Masukkan Paket Masakan';
                      }
                      onSaved:
                      (value) {
                        _pemesananName = value;
                      };
                    },
                    controller: _pemesananNameController,
                    decoration: InputDecoration(
                        focusedBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                                color: Colors.green,
                                width: 2,
                                style: BorderStyle.solid)),
                        // hintText: "Student Name",
                        labelText: "Paket Masakan",
                        icon: Icon(Icons.shopping_bag_rounded,
                            color: Colors.green),
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.green[400],
                        )),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.green,
                child: Text(
                  (isUpdate ? 'Edit' : 'Pesan'),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (isUpdate) {
                    if (_formStateKey.currentState.validate()) {
                      _formStateKey.currentState.save();
                      dbHelper
                          .update(
                              Pemesanan(pemesananIdForUpdate, _pemesananName))
                          .then((data) {
                        setState(() {
                          isUpdate = false;
                        });
                      });
                    }
                  } else {
                    if (_formStateKey.currentState.validate()) {
                      _formStateKey.currentState.save();
                      dbHelper.add(Pemesanan(null, _pemesananName));
                    }
                  }
                  _pemesananNameController.text = '';
                  refreshPemesananList();
                },
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              RaisedButton(
                color: Colors.red,
                child: Text(
                  (isUpdate ? 'Cancel' : 'Batal'),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _pemesananNameController.text = '';
                  setState(() {
                    isUpdate = false;
                    pemesananIdForUpdate = null;
                  });
                },
              ),
            ],
          ),
          const Divider(
            height: 5.0,
          ),
          Expanded(
            child: FutureBuilder(
              future: pemesanans,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return generateList(snapshot.data);
                }
                if (snapshot.data == null || snapshot.data.length == 0) {
                  return Text('Data Kosong!!!');
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView generateList(List<Pemesanan> pemesanans) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('Pesanan'),
            ),
            DataColumn(
              label: Text('Cancel'),
            )
          ],
          rows: pemesanans
              .map(
                (Pemesanan) => DataRow(
                  cells: [
                    DataCell(
                      Text(Pemesanan.name),
                      onTap: () {
                        setState(() {
                          isUpdate = true;
                          pemesananIdForUpdate = Pemesanan.id;
                        });
                        _pemesananNameController.text = Pemesanan.name;
                      },
                    ),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          dbHelper.delete(Pemesanan.id);
                          refreshPemesananList()();
                        },
                      ),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
