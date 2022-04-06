import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tsukiyomi/globalvar.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

bool _validate = false;
final name = TextEditingController();
final rrn = TextEditingController();

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              MainPageInfo,
            ),
            Div,
            Div,
            Text(
              Infoonhome,
            ),
            Div,
            Div,
            TextField(
              controller: name,
              decoration: InputDecoration(
                errorText: _validate ? 'Value Can\'t Be Empty' : null,
                border: const OutlineInputBorder(),
                labelText: 'Enter Your Name',
              ),
            ),
            Div,
            TextField(
              controller: rrn,
              decoration: InputDecoration(
                errorText: _validate ? 'Value Can\'t Be Empty' : null,
                border: const OutlineInputBorder(),
                labelText: 'Enter Your RRN',
              ),
            ),
            Div,
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(CustomClrBar),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                fixedSize: MaterialStateProperty.all(const Size(2000, 40)),
              ),
              onPressed: () async {
                bool isConnected =
                    await InternetConnectionChecker().hasConnection;

                setState(() {
                  isConnected
                      ? _launchTrainURL()
                      : showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                backgroundColor: CustomunClrBar,
                                title: const Text('Connection Error'),
                                content: const Text('Check your connectivity'),
                              ));
                });
              },
              child: const Text('Train Data'),
            ),
            Div,
            const Divider(),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                fixedSize: MaterialStateProperty.all(const Size(2000, 40)),
              ),
              onPressed: () async {
                bool isConnected =
                    await InternetConnectionChecker().hasConnection;

                setState(() {
                  isConnected
                      ? _launchDetectURL()
                      : showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            backgroundColor: CustomunClrBar,
                            title: const Text('Connection Error'),
                            content: const Text('Check your connectivity'),
                          ),
                        );
                });
              },
              child: const Text('Detect Classroom'),
            ),
            Div,
            Div,
            const Text("Real Time Data Implementation Process "
                "will design after Second Review"),
            Div,
            Text(info3),
          ],
        ),
      ),
    );
  }
}

String _train = "http://192.168.134.219:5000/train/${name.text}/${rrn.text}";

String _detect = "http://192.168.134.219:5000/detect";

void _launchDetectURL() async {
  if (!await launch(_detect)) throw 'Could not launch $_detect';
}

void _launchTrainURL() async {
  if (!await launch(_train)) throw 'Could not launch $_train';
}
