// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EventModel {
  final String category;
  final String title;
  final String date;
  final String time;
  EventModel({
    required this.category,
    required this.title,
    required this.date,
    required this.time,
  });

  EventModel copyWith({
    String? category,
    String? title,
    String? date,
    String? time,
  }) {
    return EventModel(
      category: category ?? this.category,
      title: title ?? this.title,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'title': title,
      'date': date,
      'time': time,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      category: map['category'] as String,
      title: map['title'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventModel(category: $category, title: $title, date: $date, time: $time)';
  }

  @override
  bool operator ==(covariant EventModel other) {
    if (identical(this, other)) return true;

    return other.category == category &&
        other.title == title &&
        other.date == date &&
        other.time == time;
  }

  @override
  int get hashCode {
    return category.hashCode ^ title.hashCode ^ date.hashCode ^ time.hashCode;
  }
}
