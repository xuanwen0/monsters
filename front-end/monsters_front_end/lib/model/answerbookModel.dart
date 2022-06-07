// ignore_for_file: file_names

import 'dart:convert';

class Answerbook {
  final int id;
  final String content;

  Answerbook({required this.id, required this.content});

  Answerbook copyWith({
    int? id,
    String? content,
  }) {
    return Answerbook(
      id: id ?? this.id,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'content': content};
  }

  factory Answerbook.fromMap(Map<String, dynamic> map) {
    return Answerbook(id: map['id'], content: map['content']);
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory Answerbook.fromJson(String source) =>
      Answerbook.fromMap(json.decode(source));

  @override
  String toString() => 'Answerbook(id: $id, context: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Answerbook && other.id == id && other.content == content;
  }

  @override
  int get hashCode => id.hashCode ^ content.hashCode;
}
