class FeedbackModel {
  int? roll_number;
  String? name;
  int? report;

  FeedbackModel({this.roll_number, this.name, this.report});

  factory FeedbackModel.fromJson(dynamic json) {
    return FeedbackModel(
      roll_number: json["roll_number"],
      name: json['name'],
      report: json["report"],
    );
  }

  Map toJson() => {
        "roll_number": roll_number,
        "name": name,
        "report": report,
      };
}
