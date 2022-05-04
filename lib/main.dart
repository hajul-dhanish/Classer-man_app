import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:tsukiyomi/page/explore.dart';
import 'package:tsukiyomi/page/home.dart';
import 'package:tsukiyomi/page/profile.dart';
import 'package:tsukiyomi/page/settings.dart';
import 'globalvar.dart';

void main() async{
    final gsheet = GSheets(credentials);
  final ss = await gsheet.spreadsheet(spreadsheetid);
  var sheet = ss.worksheetByTitle('Project-classer');

  final cellsRow = await sheet!.cells.row(1);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [
    const Homepage(),
    // const ExplorePage(),
    SettingsPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Infinite"),
            SizedBox(width: 8),
            Icon(Icons.remove_red_eye_rounded),
            SizedBox(width: 8),
            Text("Tsukiyomi")
          ],
        ),
        backgroundColor: CustomClrBar,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.output),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Academy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: CustomunClrBar,
        backgroundColor: CustomClrBar,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        onTap: _onItemTapped,
      ),
      body: _tabs.elementAt(_selectedIndex),
    );
  }
}
