// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
//@dart=2.9

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eas/home.dart';
import 'dosen_edit.dart';
import 'dosen_tambahdata.dart';

class Detail extends StatefulWidget {
  List list;
  int index;

  Detail({this.list, this.index});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://192.168.43.230/crud_flutter/deleteData_dosen.php";
    http.post(Uri.parse(url),
        body: {'kode_dsn': widget.list[widget.index]['kode_dsn']});
  }

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
          "Yakin ingin menghapus data '${widget.list[widget.index]['nama']}' ?"),
      actions: <Widget>[
        RaisedButton(
          child: Text(
            "Yakin!",
            style: TextStyle(color: Colors.black),
          ),
          color: Colors.blue,
          onPressed: () {
            deleteData();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => HomePage(),
            ));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
              'Data Berhasil Dihapus',
              textAlign: TextAlign.center,
            )));
          },
        ),
        RaisedButton(
          child: Text(
            "Kembali",
            style: TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['nama']}"),
      ),
      body: Container(
        height: 500.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Text("Kode Dosen",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                ),
                Text(
                  widget.list[widget.index]['kode_dsn'],
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                ),
                Text("Nama Dosen",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                ),
                Text(
                  widget.list[widget.index]['nama'],
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                ),
                Text("Alamat Dosen",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                ),
                Text(
                  widget.list[widget.index]['alamat'],
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                ),
                Text("No. Telp. Dosen",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                ),
                Text(
                  widget.list[widget.index]['no_telp'],
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("EDIT"),
                      color: Colors.blue,
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) => DosenEdit(
                                  list: widget.list,
                                  index: widget.index,
                                )),
                      ),
                    ),
                    RaisedButton(
                      child: Text("DELETE"),
                      color: Colors.yellow,
                      onPressed: () => confirm(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
