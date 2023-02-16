// ignore_for_file: public_member_api_docs, sort_constructors_first

class AuthModel {
  final int numberID;
  final String email;
  final String password;
  AuthModel({
    required this.numberID,
    required this.email,
    required this.password,
  });

  AuthModel copyWith({
    int? numberID,
    String? email,
    String? password,
  }) {
    return AuthModel(
      numberID: numberID ?? this.numberID,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numberID': numberID,
      'email': email,
      'password': password,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      numberID: map['numberID'] as int,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  Map<String, dynamic> toJson() {
    return {
      "numberID": numberID,
      "email": email,
      "password": password,
    };
  }

  factory AuthModel.fromJson(Map<String, dynamic> parsedJson) {
    return AuthModel(
        numberID: parsedJson['numberID'] ?? '',
        email: parsedJson['email'] ?? '',
        password: parsedJson['password'] ?? '');
  }

  @override
  String toString() =>
      'AuthModel(numberID: $numberID, email: $email, password: $password)';

  @override
  bool operator ==(covariant AuthModel other) {
    if (identical(this, other)) return true;

    return other.numberID == numberID &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => numberID.hashCode ^ email.hashCode ^ password.hashCode;
}
