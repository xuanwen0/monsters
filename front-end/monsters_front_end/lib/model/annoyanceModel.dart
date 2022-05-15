// ignore_for_file: file_names

import 'dart:convert';

Annoyance annoyanceFromJson(String string) => Annoyance.fromJson(json.decode(string));

class Annoyance {
  final String account;
  final String context;
  final String type;
  final String mood;
  final String index;

  Annoyance({
    required this.account, 
    required this.context, 
    required this.type, 
    required this.mood, 
    required this.index
  });

  Annoyance copyWith({
    String? account,
    String? context,
    String? type,
    String? mood,
    String? index
  }) {
    return Annoyance(
      account: account ?? this.account,
      context: context ?? this.context,
      type: type ?? this.type,
      mood: mood ?? this.mood,
      index: index ?? this.index
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'account': account,
      'context': context,
      'type': type,
      'mood': mood,
      'index': index
    };
  }

  factory Annoyance.fromMap(Map<String, dynamic> map) {
    return Annoyance(
      account: map['username'],
      context: map['password'],
      type: map['type'],
      mood: map['mood'],
      index: map['index']
    );
  }

  String toJson(){
    return json.encode(toMap());
  }

  factory Annoyance.fromJson(String source) => Annoyance.fromMap(json.decode(source));


  @override
  String toString() => 'Annoyance(account: $account, context: $context, type: $type, mood: $mood, index: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Annoyance &&
        other.account == account &&
        other.context == context &&
        other.type == type &&
        other.mood == mood &&
        other.index == index;
  }

  @override
  int get hashCode => account.hashCode ^ 
                      context.hashCode ^ 
                      type.hashCode ^ 
                      mood.hashCode ^
                      index.hashCode;
}