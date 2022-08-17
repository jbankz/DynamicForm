import 'dart:convert';

class UserModel {
  String? email;
  int? age;

  UserModel({
    this.email,
    this.age,
  });

  UserModel copyWith({
    String? email,
    int? age,
  }) {
    return UserModel(
      email: email ?? this.email,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'age': age,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      age: map['age']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(email: $email, age: $age)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && other.email == email && other.age == age;
  }

  @override
  int get hashCode => email.hashCode ^ age.hashCode;
}
