// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UpdateUserModel {
  final String name;
  final String lastName;
  final String profilePicUrl;
  final int userNumber;
  final int cramSchoolID;
  UpdateUserModel({
    required this.name,
    required this.lastName,
    required this.profilePicUrl,
    required this.userNumber,
    required this.cramSchoolID,
  });

  UpdateUserModel copyWith({
    String? name,
    String? lastName,
    String? profilePicUrl,
    int? userNumber,
    int? cramSchoolID,
  }) {
    return UpdateUserModel(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      userNumber: userNumber ?? this.userNumber,
      cramSchoolID: cramSchoolID ?? this.cramSchoolID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'lastName': lastName,
      'profilePicUrl': profilePicUrl,
      'userNumber': userNumber,
      'cramSchoolID': cramSchoolID,
    };
  }

  factory UpdateUserModel.fromMap(Map<String, dynamic> map) {
    return UpdateUserModel(
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      profilePicUrl: map['profilePicUrl'] as String,
      userNumber: map['userNumber'] as int,
      cramSchoolID: map['cramSchoolID'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateUserModel.fromJson(String source) => UpdateUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UpdateUserModel(name: $name, lastName: $lastName, profilePicUrl: $profilePicUrl, userNumber: $userNumber, cramSchoolID: $cramSchoolID)';
  }

  @override
  bool operator ==(covariant UpdateUserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.lastName == lastName &&
      other.profilePicUrl == profilePicUrl &&
      other.userNumber == userNumber &&
      other.cramSchoolID == cramSchoolID;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      lastName.hashCode ^
      profilePicUrl.hashCode ^
      userNumber.hashCode ^
      cramSchoolID.hashCode;
  }
}
