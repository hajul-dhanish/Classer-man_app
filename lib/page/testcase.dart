// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Future<List<Data>> futureData;

//   @override
//   void initState() {
//     super.initState();
//     futureData = fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Attendance',
//       home: Scaffold(
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
