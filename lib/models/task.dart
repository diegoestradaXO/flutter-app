class Task {
  final int? id;
  final String title;
  final String? description;
  final String date;
  Task({this.id, required this.title, this.description, required this.date});

  Map<String, dynamic> toMap() {
    return{
      'id':id,
      'title':title,
      'description':description,
      'date':date,
    };
  }
}