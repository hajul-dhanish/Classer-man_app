import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

Future<List<Data>> fetchData() async {
  final response = await http.get(Uri.parse(
      'https://script.googleusercontent.com/macros/echo?user_content_key=IkklVA7Dko7FLTtWuZ2gcTbfJWf-tGUZdAVCs1GMFUXsatJZ18piyZOyxsLVMk9ydc6O93cAEzYpegqllhdppo13q39dWie1m5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnI_SpNUtsMxnqutfepc5qFUW74YoSFwuvtvoPEL-YLI0HrFL9xBqpXdbtuQumLhC3nWZjz-AgEJ3nsOZl64RQ8Jyx4wQFJcmlQ&lib=MdgJwvfZOJOcoXkHZjHU0MVFIFftGoKYS'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Data {
  int roll_number;
  final String name;
  // ignore: prefer_typing_uninitialized_variables
  var report;

  Data({required this.roll_number, required this.name, required this.report});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      roll_number: json['roll_number'],
      name: json['name'],
      report: json['report'],
    );
  }
}

// const credentials = r'''
// {
//   "type": "service_account",
//   "project_id": "classer-man",
//   "private_key_id": "fb8f5b3536d30812ce979cebba0dcf3b954706ad",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDFehdJPb6KuxN2\n7mumYRW1lgRZItFQ3i8HiLcHMHhv8p8zgEB4oQ43AfcCpJpb/ZHh3dXNemOh0x+0\ntBmsE8p3+K8zUztb5lVf3EO3eEzgaubNYXDnGNQOzTb5PFzy7HbbSe4nuydtoFRh\n8XP2SPFelF9D3INx2cCfrd3wIRkywWu4P2fSyPkwOTZbOHO3RxqtT9vdufXmX7HM\n2BO4Nu7uZ7Et6fuBN0Xi2FxvSqP5312OQUbJcY5+JM7BUnArzJM5Pli3ArBV8XqA\nOmfOrnbGItusowvK2WRj5gFn16iDULAovAyI/ZoUBFC6g0IXlMzC4oz3zBAJ4qTY\ntvlEefmHAgMBAAECggEAExa1L4g/Zeulewaa809JKO9iZjdeYmHHzAOkJZbC3Zdn\nWjQYh1CSLjELbn74yNGfC2VFKIKfJOJimzYZkS+sj6JDVUPDZiPCtux0w0Rmsf7D\nZrD3l+8neHLP0JHMLlM7PgFMexy1N/yai4kqe3Ebm9fdyZKERjoVS5oj7PVWGTi7\ngx2dwAIrHQsrG5mmfzyMnCZehWUEAL89wUz2yvzL+xbFoEU4Gxbx3MobXPdGetRg\nmKD5tHpl7jpSR8Kag+tTr5YrkkWvg9IbKTxE2Qd2Wcx3FpvPIP0rVl71fhXV6pIC\nJFCQIdFVkzSzh7keaINcGXp1aNqkBw92FVwcpRzZWQKBgQD32a4HQGG8N6lAWPRp\nXtl4kqOfmfu4oESF2azbtnV/TIojRIxkDULghOP3JgiqnJxkZ9QTiRy5MaSiy+zI\nzcKBmYuXhCe20YGB7x+6LBkKr8tmDGDzMUQyB6917LyRX8L81RD8M26HDzc58iT0\n4KrOotucB73JhVieKD3ezhkM+wKBgQDL+GKMBzurujKbVlRIDoQG3AmYxguHRmEP\nuLTP/g3vLBQ9vFBxag1UxOGZQELDp5UHk41QIFzRZOX8RV++Iz+g7DN0mmBgyTDZ\nwqFIMWGueJY4ryIkXhYscD6h6CkIK63WoeoqtPLz9jOpSzDqWFfDVaESLs+k41zX\naph2L1uH5QKBgQDHjW3+zKlkP3R4KKbwx7tUxswSzonLhs5k7nOsmuVTTy7RYnme\nfMbhul1JOkg0BdAtTyODbxu/R+cEZCgLLQ90BUpM/cxz947MLNlgreyjnBKp4UGV\nzI7ZsTJmQes5KN73bh000bwl5exTLVDwEIu1v44NvHXj8Qb+n+vgnhOxTQKBgGuB\nOP+w+ERk2TOCZt2ruO6cnvpEt+LOt22/3p0ZvGJpCyoWzRdZ3DjnpDhP5GCXPTdH\nD95BkGpVEdrK/dGLZof8toooq8+XewXrTXJthJyeth6eQBKG/IzjhD91y9qgmvlb\nUb68rKjlBQmfteJuOaOcyE57GbpAk7h+WGlCQK35AoGBAJ5YGmAcQ8vsjqbVITHN\ndjBmEEq2BH4dvk6kvuwkAYqYaBIcWPO9xMpAgFk/65/KHgbL6LdYiWgoYgMb5Q8i\nZNFHXHsnRJd9TfHPjKjcwm11O91DG50fRjOB8AenIXwBZQ3w/Hfb0lDFIFiIl9Fk\nTy+C91mAPdBpLcxRMlzm2h1/\n-----END PRIVATE KEY-----\n",
//   "client_email": "classer-man@classer-man.iam.gserviceaccount.com",
//   "client_id": "106049668445640084766",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/classer-man%40classer-man.iam.gserviceaccount.com"
// }
// ''';

// const spreadsheetid = '1oKFXdt9YbNpI4NnGlubgsikXzKqvPXmxrYlefJKrT34';

// class ExplorePage extends StatefulWidget {
//   const ExplorePage({Key? key}) : super(key: key);

//   @override
//   State<ExplorePage> createState() => _ExplorePageState();
// }

// class _ExplorePageState extends State<ExplorePage> {
//   late Future<List<Data>> futureData;

//   @override
//   void initState() {
//     super.initState();
//     futureData = fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter Attendance'),
//         ),
//         body: Card(
//           child: FutureBuilder<List<Data>>(
//             future: futureData,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 List<Data>? data = snapshot.data;
//                 return SizedBox(
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   child: DataTable(
//                       columns: const [
//                         DataColumn(
//                           label: Text('Roll Number'),
//                         ),
//                         DataColumn(
//                           label: Text('Name'),
//                         ),
//                         DataColumn(
//                           label: Text('Report'),
//                         ),
//                       ],
//                       rows: data!
//                           .map((data) => DataRow(cells: [
//                                 DataCell(Text(data.roll_number.toString())),
//                                 DataCell(Text(data.name)),
//                                 DataCell(Text(data.report.toString())),
//                               ]))
//                           .toList()),
//                 );
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }
//               // By default show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: FutureBuilder<List<Data>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Data>? data = snapshot.data;
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: DataTable(
                    columns: const [
                      DataColumn(
                        label: Text('Roll Number'),
                      ),
                      DataColumn(
                        label: Text('Name'),
                      ),
                      DataColumn(
                        label: Text('Report'),
                      ),
                    ],
                    rows: data!
                        .map((data) => DataRow(cells: [
                              DataCell(Text(data.roll_number.toString())),
                              DataCell(Text(data.name)),
                              DataCell(Text(data.report.toString())),
                            ]))
                        .toList()),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            // return const CircularProgressIndicator();
            return SizedBox(
              // width: 200.0,
              // height: 100.0,
              child: Shimmer.fromColors(
                baseColor: Colors.black,
                highlightColor: Colors.yellow,
                child: const Center(
                  child: Text(
                    'Loading',
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
