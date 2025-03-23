class Taskmodel {
  final int id;
  final String title;
  final String description;
  late  bool status;


  Taskmodel(
    this.id, {
    required this.title,
    required this.description,
    this.status = false,
  });

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
    };
  }

  factory Taskmodel.fromJson(Map<String, dynamic> json) {
    return Taskmodel(
      json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
    );
  }

}
