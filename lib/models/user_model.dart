// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  final String name;
  final String profilePic;
  final List<String> createdEvents;
  final String uid;
//  final bool isAuthenticated; // if guest or not

  UserModel({
    required this.name,
    required this.profilePic,
    required this.createdEvents,
    required this.uid,
  });

  UserModel copyWith({
    String? name,
    String? profilePic,
    List<String>? createdEvents,
    String? uid,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      createdEvents: createdEvents ?? this.createdEvents,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'createdEvents': createdEvents,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      createdEvents: (map["createdEvents"] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, profilePic: $profilePic, createdEvents: $createdEvents, uid: $uid)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.profilePic == profilePic &&
        listEquals(other.createdEvents, createdEvents) &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        profilePic.hashCode ^
        createdEvents.hashCode ^
        uid.hashCode;
  }
}
