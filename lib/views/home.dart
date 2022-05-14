import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'feedback_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<FeedbackModel> feedbacks = <FeedbackModel>[];

  getFeedbackFromSheet() async {
    var raw = await http.get(Uri.parse(
        "https://script.googleusercontent.com/macros/echo?user_content_key=UEW3Hvx_arEQgbpCjpBQeKYeG_VldlmNNNe_AO8EicgemkIuYKAS_HeIdJzasNcHKV-fyxdWAYL_hd6vn2sub1AzygnXytulm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnI_SpNUtsMxnqutfepc5qFUW74YoSFwuvtvoPEL-YLI0HrFL9xBqpXdbtuQumLhC3nWZjz-AgEJ3nsOZl64RQ8Jyx4wQFJcmlQ&lib=MdgJwvfZOJOcoXkHZjHU0MVFIFftGoKYS"));

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('this is json Feedback $jsonFeedback');

    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      // print('$element THIS IS NEXT>>>>>>>');
      FeedbackModel feedbackModel = FeedbackModel();
      feedbackModel.roll_number = element['roll_number'];
      feedbackModel.name = element['name'];
      feedbackModel.report = element['report'];

      feedbacks.add(feedbackModel);
    });

    // print('${feedbacks[0]}');
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students"),
        elevation: 0,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: feedbacks.length,
            itemBuilder: (context, index) {
              return FeedbackTile(
                roll_number: feedbacks[index].roll_number.toString(),
                name: feedbacks[index].name.toString(),
                report: feedbacks[index].report.toString(),
              );
            }),
      ),
    );
  }
}

// class FeedbackTile extends StatelessWidget {
//   final String roll_number, name, report;
//   FeedbackTile({this.roll_number, this.name, this.report});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                   height: 40,
//                   width: 40,
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(40)),
//                       child: Image.network(profilePic))),
//               SizedBox(width: 16),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(name),
//                   Text(
//                     'from $source',
//                     style: TextStyle(color: Colors.grey),
//                   )
//                 ],
//               )
//             ],
//           ),
//           SizedBox(height: 16),
//           Text(feedback)
//         ],
//       ),
//     );
//   }
// }

class FeedbackTile extends StatelessWidget {
  final String roll_number, name, report;
  FeedbackTile(
      {required this.roll_number, required this.name, required this.report});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Roll Number',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Name',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Attendance',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text(roll_number)),
              DataCell(Text(name)),
              DataCell(Text(report)),
            ],
          ),
        ],
      ),
    );
  }
}
