class MessageModel {
  String? sender;
  String? text;

  DateTime? createdon;

  MessageModel({this.sender, this.text, this.createdon});

  MessageModel.fromMap(Map<String, dynamic> map) {
    sender = map["sender"];
    text = map["text"];
  }

  Map<String, dynamic> toMap() {
    return {"sender": sender, "text": text, "createdon": createdon};
  }
}
