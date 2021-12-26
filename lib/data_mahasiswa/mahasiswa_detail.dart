// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
//@dart=2.9

import 'dart:async';
import 'dart:convert';
import 'package:eas/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eas/home.dart';
import 'mahasiswa_edit.dart';

class Detail extends StatefulWidget {
  List list;
  int index;

  Detail({this.list, this.index});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://192.168.43.230/crud_flutter/deleteData.php";
    http.post(Uri.parse(url), body: {'nbi': widget.list[widget.index]['nbi']});
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
                Text("NBI",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                ),
                Text(
                  widget.list[widget.index]['nbi'],
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                ),
                Text("Nama",
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
                Text("Alamat",
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
                Text("IPK",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                ),
                Text(
                  widget.list[widget.index]['ipk'],
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                ),
                Text("Dosen Wali",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                ),
                Text(
                  widget.list[widget.index]['dosen_wali'],
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
                            builder: (BuildContext context) => MahasiswaEdit(
                                  list: widget.list,
                                  index: widget.index,
                                )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
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
