import 'package:flutter/material.dart';

import '../globalvar.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: const Text(
                    'App Settings',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF999999)),
                  ),
                ),
                ItemCard(
                  title: 'Change system Configuration',
                  cons: '',
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: const Text(
                    'Others',
                  ),
                ),
                ItemCard(
                  title: 'About Us',
                  cons: '',
                ),
                ItemCard(
                  title: 'Donate ',
                  cons: '',
                ),
                ItemCard(
                  title: 'Contact Us',
                  cons: '',
                ),
                ItemCard(
                  title: 'version',
                  cons: 'V0.11-Beta',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  ItemCard({
    required this.title,
    // required this.color,
    required this.cons,
    // required this.callback,
    // required this.textColor,
  });

  // final Color color;
  // final Color textColor;
  final String title;
  final String cons;
  // final Function callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          height: 60,
          // color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 24),
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 24),
                child: Center(
                  child: Text(
                    cons,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                    // backgroundColor: CustomunClrBar,
                    title: Text('We Working On It'),
                    content: Text('Will be There on Third Review :)'),
                  ));
        });
    //   },
    // );
  }
}
