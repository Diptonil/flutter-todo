class Todo {  
  String title;
  bool isComplete;
  DateTime createdOn;

  Todo({
    required this.title,
    this.isComplete = false,
    required this.createdOn
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['name'] as String,
      isComplete: json['isComplete'] as bool,
      createdOn: json['createdOn'] as DateTime
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      "title": title,
      "isComplete": isComplete,
      "createdOn": createdOn
    };
  }
}

