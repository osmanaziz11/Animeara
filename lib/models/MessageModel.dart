class MessageModel {
  String? sender;
  String? text;
  DateTime? createdon = DateTime.now();

  MessageModel({this.sender, this.text});

  MessageModel.fromMap(Map<String, dynamic> map) {
    sender = map["sender"];
    text = map["text"];
  }

  Map<String, dynamic> toMap() {
    return {"sender": sender, "text": text, "createdon": createdon};
  }
}
