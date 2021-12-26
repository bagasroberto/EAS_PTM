// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print
//@dart=2.9

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LaporanPage extends StatefulWidget {
  @override
  _LaporanPage createState() => _LaporanPage();
}

class _LaporanPage extends State<LaporanPage> {
  Future<List> getData() async {
    final response = await http
        .get(Uri.parse("http://192.168.43.230/crud_flutter/getdata.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Mahasiswa'),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data ?? [],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: Card(
              child: ListTile(
            title: Text(list[i]['nama']),
            leading: Icon(Icons.people),
            subtitle: Text("NBI : ${list[i]['nbi']}"),
          )),
        );
      },
    );
  }
}
