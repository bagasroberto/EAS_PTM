// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_new
// @dart=2.9

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class TambahData extends StatefulWidget {
  const TambahData({Key key}) : super(key: key);

  @override
  _TambahDataState createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  //Image
  File imageFile;
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  //Prodi
  String prodi;
  int _value1;

  //Fakultas
  String fakultas;
  int _value;

  //DATE
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1945, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        selectedDate = picked;
      });
  }

  void clear() {
    setState(() {
      controllerNbi.clear();
      controllerNama.clear();
      controllerAlamat.clear();
      controllerEmail.clear();
      controllerNoTelp.clear();
      controllerIpk.clear();
      controllerDosenwali.clear();
      selectedDate = DateTime.now();
      imageFile = null;
    });
  }

  TextEditingController controllerNbi = TextEditingController();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerNoTelp = TextEditingController();
  TextEditingController controllerIpk = TextEditingController();
  TextEditingController controllerDosenwali = TextEditingController();

  void addData() {
    var url = "http://192.168.43.230/crud_flutter/adddata.php";
    http.post(Uri.parse(url), body: {
      "nbi": controllerNbi.text,
      "nama": controllerNama.text,
      "alamat": controllerAlamat.text,
      "tgl_lahir": "${selectedDate.toLocal()}".split(' ')[0],
      "email": controllerEmail.text,
      "no_telp": controllerNoTelp.text,
      "prodi": prodi,
      "fakultas": fakultas,
      "ipk": controllerIpk.text,
      "dosen_wali": controllerDosenwali.text,
      "foto": imageFile.path.split('/').last
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Container(
            child: Text(
              "Form Mahasiswa",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height * 1.2,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 9,
                    left: MediaQuery.of(context).size.width / 12,
                    child: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      width: 300,
                      child: TextField(
                          controller: controllerNbi,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                            labelText: "NBI",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: "Masukkan NBI",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 5.3,
                    left: MediaQuery.of(context).size.width / 12,
                    child: Container(
                      margin: EdgeInsets.only(top: 25, bottom: 10),
                      width: 300,
                      child: TextField(
                          controller: controllerNama,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                            labelText: "Nama",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: "Masukkan Nama",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 3.75,
                    left: MediaQuery.of(context).size.width / 12,
                    child: Container(
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      width: 300,
                      child: TextField(
                          controller: controllerAlamat,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                            labelText: "Alamat",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: "Masukkan Alamat",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2.54,
                    left: MediaQuery.of(context).size.width / 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5, left: 20),
                          width: 230,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.blue,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.date_range,
                                color: Colors.blue,
                              ),
                              Container(
                                width: 7,
                              ),
                              Text(
                                "${selectedDate.toLocal()}".split(' ')[0],
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 20,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.date_range_sharp,
                              size: 20,
                            ),
                            color: Colors.white,
                            onPressed: () => _selectDate(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2.41,
                    left: MediaQuery.of(context).size.width / 12,
                    child: Container(
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      width: 300,
                      child: TextField(
                          controller: controllerEmail,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: "Masukkan Email",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2,
                    left: MediaQuery.of(context).size.width / 12,
                    child: Container(
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      width: 300,
                      child: TextField(
                          controller: controllerNoTelp,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                            labelText: "No.Telp",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: "Masukkan No.Telp",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.59,
                    left: MediaQuery.of(context).size.width / 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          width: 80,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text('Prodi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              )),
                        ),
                        Container(
                          width: 10,
                        ),
                        Container(
                            width: 210,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.blue,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        iconSize: 20,
                                        value: _value,
                                        items: const [
                                          DropdownMenuItem(
                                            child: Text(
                                              "Ilmu Komunikasi",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              "Ilmu Hukum",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              "Ekonomi Manajemen",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            value: 3,
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              "Psikologi",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            value: 4,
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              "Teknik Informatika",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            value: 5,
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              "Sastra Inggris",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            value: 6,
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              "Teknologi Listrik",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            value: 7,
                                          ),
                                        ],
                                        onChanged: (int newvalue) {
                                          setState(() {
                                            _value = newvalue;
                                          });
                                          if (_value == 1) {
                                            prodi = 'Ilmu Komunikasi';
                                          } else if (_value == 2) {
                                            prodi = 'Ilmu Hukum';
                                          } else if (_value == 3) {
                                            prodi = 'Manajemen Bisnis';
                                          } else if (_value == 4) {
                                            prodi = 'Ilmu Psikologi';
                                          } else if (_value == 5) {
                                            prodi = 'Teknik Informatika';
                                          } else if (_value == 6) {
                                            prodi = 'Sastra Inggris';
                                          } else if (_value == 7) {
                                            prodi = 'Teknologi Listrik';
                                          }
                                        },
                                        hint: Text("Select item")),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.44,
                    left: MediaQuery.of(context).size.width / 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          width: 80,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text('Fakultas',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              )),
                        ),
                        Container(
                          width: 10,
                        ),
                        Container(
                            width: 210,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.blue,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        iconSize: 20,
                                        value: _value1,
                                        items: const [
                                          DropdownMenuItem(
                                            child: Text(
                                              "Ilmu Sosial dan Politik",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              "Hukum",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              "Ekonomi dan Bisnis",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            value: 3,
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              "Psikologi",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            value: 4,
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              "Teknik",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            value: 5,
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              "Ilmu Budaya",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            value: 6,
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              "Vokasi",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            value: 7,
                                          ),
                                        ],
                                        onChanged: (int newvalue) {
                                          setState(() {
                                            _value1 = newvalue;
                                          });
                                          if (_value == 1) {
                                            fakultas =
                                                'Ilmu Sosial dan Politik';
                                          } else if (_value1 == 2) {
                                            fakultas = 'Hukum';
                                          } else if (_value1 == 3) {
                                            fakultas = 'Ekonomi dan Bisnis';
                                          } else if (_value1 == 4) {
                                            fakultas = 'Psikologi';
                                          } else if (_value1 == 5) {
                                            fakultas = 'Teknik';
                                          } else if (_value1 == 6) {
                                            fakultas = 'Ilmu Budaya';
                                          } else if (_value1 == 7) {
                                            fakultas = 'Vokasi';
                                          }
                                        },
                                        hint: Text("Select item")),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.34,
                    left: MediaQuery.of(context).size.width / 12,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      width: 300,
                      child: TextField(
                          controller: controllerIpk,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                            labelText: "IPK",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: "Masukkan IPK",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.18,
                    left: MediaQuery.of(context).size.width / 12,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: 300,
                      child: TextField(
                          controller: controllerDosenwali,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                            labelText: "Dosen Wali",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: "Masukkan Nama Dosen Wali",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.04,
                    left: MediaQuery.of(context).size.width / 1.7,
                    child: Container(
                        height: 70,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  clear();
                                },
                                icon: Icon(Icons.restore, color: Colors.white),
                                label: Text(
                                  "Reset",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(200),
                                    )),
                              ),
                              Container(
                                width: 60,
                              ),
                            ],
                          ),
                        )),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 0.97,
                    right: MediaQuery.of(context).size.width / 7.3,
                    child: Container(
                        height: 80,
                        child: Container(
                          height: 20,
                          margin: EdgeInsets.only(top: 0),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  addData();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    'Data Berhasil Ditambahkan',
                                    textAlign: TextAlign.center,
                                  )));
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.import_export,
                                    color: Colors.white),
                                label: Text(
                                  "Submit",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(200),
                                    )),
                              ),
                              Container(
                                width: 30,
                              ),
                            ],
                          ),
                        )),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.05,
                    right: MediaQuery.of(context).size.width / 2,
                    child: Container(
                        child: imageFile == null
                            ? Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 2,
                                  ),
                                ),
                                child: TextButton(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Icon(Icons.image, color: Colors.blue),
                                      Container(
                                        width: 8,
                                      ),
                                      Text('Upload Foto',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 15,
                                            color: Colors.blue,
                                          )),
                                    ],
                                  ),
                                  onPressed: () {
                                    _getFromGallery();
                                  },
                                ),
                              )
                            : Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                    )),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    imageFile,
                                    fit: BoxFit.cover,
                                  ),
                                ))),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
