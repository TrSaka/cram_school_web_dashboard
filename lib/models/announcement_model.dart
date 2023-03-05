// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnnouncementModel {
  final String subtitle;
  final String title;
  final DateTime? deadline;
  late final String? studentClass;
  final int? studentNumber;
  AnnouncementModel({
    required this.subtitle,
    required this.title,
    this.deadline,
    this.studentClass,
    this.studentNumber,
  });

  AnnouncementModel copyWith({
    String? subtitle,
    String? title,
    DateTime? deadline,
    String? studentClass,
    int? studentNumber,
  }) {
    return AnnouncementModel(
      subtitle: subtitle ?? this.subtitle,
      title: title ?? this.title,
      deadline: deadline ?? this.deadline,
      studentClass: studentClass ?? this.studentClass,
      studentNumber: studentNumber ?? this.studentNumber,
    );
  }

  Map<String, dynamic> toGeneral() {
    return <String, dynamic>{
      'subtitle': subtitle,
      'title': title,
      'deadline': deadline,
    };
  }

  Map<String, dynamic> toClass() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'deadline': deadline,
      'studentClass': studentClass,
    };
  }

  Map<String, dynamic> toPrivate() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'deadline': deadline,
      'studentNumber': studentNumber.toString(),
    };
  }

  factory AnnouncementModel.fromMap(map) {
    return AnnouncementModel(
      subtitle: map['subtitle'],
      title: map['title'],
      deadline: map['deadline'] != null
          ? (map['deadline'] as Timestamp).toDate()
          : null,
      studentClass:
          map['studentClass'] != null ? map['studentClass'] as String : null,
      studentNumber:
          map['studentNumber'] != null ? int.parse(map['studentNumber']) : null,
    );
  }

  factory AnnouncementModel.fromJson(String source) =>
      AnnouncementModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AnnouncementModel(subtitle: $subtitle, title: $title, deadline: $deadline, studentClass: $studentClass, studentNumber: $studentNumber)';
  }

  @override
  bool operator ==(covariant AnnouncementModel other) {
    if (identical(this, other)) return true;

    return other.subtitle == subtitle &&
        other.title == title &&
        other.deadline == deadline &&
        other.studentClass == studentClass &&
        other.studentNumber == studentNumber;
  }

  @override
  int get hashCode {
    return subtitle.hashCode ^
        title.hashCode ^
        deadline.hashCode ^
        studentClass.hashCode ^
        studentNumber.hashCode;
  }
}
