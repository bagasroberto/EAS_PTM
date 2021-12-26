import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:eas/data_mahasiswa/tambahdata.dart';
import 'package:eas/data_mahasiswa/mahasiswa.dart';
import 'package:eas/data_dosen/dosen.dart';
import 'package:eas/data_mahasiswa/laporan.dart';
import 'package:eas/data_dosen/dosen_laporan.dart';
import 'package:eas/login_system/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            title: 'PTM',
            home: Login(),
            routes: <String, WidgetBuilder>{
              '/home': (BuildContext context) => HomePage(),
              '/mahasiswa': (BuildContext context) => MahasiswaPage(),
              '/dosen': (BuildContext context) => DosenPage(),
              '/laporan': (BuildContext context) => LaporanPage(),
              '/laporan_dosen': (BuildContext context) => LaporanDosenPage(),
            },
          );
        }
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: HexColor("#1E90FF"),
            ),
            height: MediaQuery.of(context).size.height * 0.11,
          ),
          Container(
            child: Image.asset(
              "images/ba.png",
              width: 250,
              height: 170,
            ),
            margin: EdgeInsets.only(top: 220, left: 55),
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            alignment: Alignment.center,
            child: Text('1461900271',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 250),
            alignment: Alignment.center,
            child: Text('Jalu Dwi Bagaskara',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                )),
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 200,
            child: UserAccountsDrawerHeader(
              accountName: Container(
                padding: EdgeInsets.all(2),
                child: Text("1461900271",
                    style: TextStyle(
                      fontSize: 16,
                    )),
              ),
              accountEmail: Container(
                padding: EdgeInsets.all(1),
                child: Text("Jalu Dwi Bagaskara",
                    style: TextStyle(
                      fontSize: 16,
                    )),
              ),
              currentAccountPicture: Container(
                margin: EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('images/sas.jpg'),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.data_saver_on),
            title: Text("Mahasiswa"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MahasiswaPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.data_saver_on),
            title: Text("Dosen"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DosenPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text("Laporan Mahasiswa"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LaporanPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text("Laporan Dosen"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LaporanDosenPage()),
              );
            },
          ),
          Divider(height: 25, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Bagas Roberto",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
        ],
      )),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Center(
        //   child: Image.asset('images/logo.png'))
        );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
  }
}
