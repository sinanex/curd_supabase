class todoModel {
  int? id;
  String? title;
  String? subtitle;

  todoModel({this.id, required this.subtitle, required this.title});

  factory todoModel.fromJson(Map<String, dynamic> json) {
    return todoModel(
        id: json['id'], subtitle: json['subtitle'], title: json['title']);
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
    };
  }
}
