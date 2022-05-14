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
              keyboardType: TextInputType.number,
              controller: name,
              decoration: InputDecoration(
                errorText: _validate ? 'Value Can\'t Be Empty' : null,
                border: const OutlineInputBorder(),
                labelText: 'IP Address',
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
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("Under Development..."),
                      action: SnackBarAction(label: "OK", onPressed: () {}),
                    ));
                  },
                  child: const Text(
                    'Train Data',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {
                    if (name.text.isNotEmpty) {
                      setState(() {
                        _launchDetectURL();
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              const Text("Please enter the valid IP-address"),
                          action: SnackBarAction(
                            label: "OK",
                            onPressed: () {},
                          ),
                        ),
                      );
                    }
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

final Uri _detect = Uri.parse("${name.text}/detect");

void _launchDetectURL() async {
  await launchUrl(_detect);
}
