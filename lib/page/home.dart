import 'package:flutter/material.dart';
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
            Row(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  ),
                  onPressed: () {
                    if (rrn.text.isNotEmpty && name.text.isNotEmpty) {
                      // _launchTrainURL();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text("Under Development..."),
                        action: SnackBarAction(label: "OK", onPressed: () {}),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            const Text("Fill the Valid student information"),
                        action: SnackBarAction(label: "OK", onPressed: () {}),
                      ));
                    }
                  },
                  child: const Text(
                    'Train Data',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {
                    _launchDetectURL();
                  },
                  child: const Text(
                    'Mark Attendance',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
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

////////// -----

// final Uri _train =
//     Uri.parse("http://192.168.134.219:5000/train/${name.text}/${rrn.text}");

// void _launchTrainURL() async {
//   if (!await launchUrl(_train)) throw 'Could not launch $_train';
// }

////////// -----

final Uri _detect = Uri.parse("http://192.168.134.219:5000/detect");

void _launchDetectURL() async {
  if (!await launchUrl(_detect)) throw 'Could not launch $_detect';
}
