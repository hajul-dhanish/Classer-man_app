import 'package:flutter/material.dart';

import '../globalvar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/mark.jpg"),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Second Review..",
                    style: TextStyle(fontSize: 20),
                  ),
                  Div,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Project Guide : ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        guide,
                        // style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Div,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Team members,",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Div,
                      Text(
                        teamMen,
                        // style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Div,
                ],
              ),
            ),
            Div,
            const Text(
              "Project Completion",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Div,
            const LinearProgressIndicator(
              value: 0.8,
              minHeight: 10,
              backgroundColor: Colors.blueGrey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("20% Left.."),
                )
              ],
            ),
            Div,
            Div,
            const Text(
              "How Its Works?",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Div,
            Text(Info1),
            Div,
            Text(Info2),
            Div,
            const Text(
              "More Update On The Way ...",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
