import 'package:hive/hive.dart';


@HiveType(typeId: 1)
class Todo extends HiveObject {  
  @HiveField(0) String title;
  @HiveField(1) bool isComplete;
  @HiveField(2) DateTime createdOn;

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

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  final int typeId = 1;

  @override
  Todo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todo(
      title: fields[0] as String,
      isComplete: fields[1] as bool,
      createdOn: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.isComplete)
      ..writeByte(2)
      ..write(obj.createdOn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is TodoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}