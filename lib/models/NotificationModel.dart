class NotificationModel {
  String? text;
  String? feedback;

  DateTime? createdon;

  NotificationModel({this.text, this.feedback, this.createdon});

  NotificationModel.fromMap(Map<String, dynamic> map) {
    text = map["text"];
    feedback = map["feedback"];
  }

  Map<String, dynamic> toMap() {
    return {"text": text, "feedback": feedback, "createdon": createdon};
  }
}
