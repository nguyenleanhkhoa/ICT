import 'package:hive/hive.dart';
import 'dart:convert';
part 'user_auth.model.g.dart';

////////////////////////////////////
// To parse this JSON data, do
//
//     final userAuth = userAuthFromJson(jsonString);

UserAuth userAuthFromJson(String str) =>
    UserAuth.fromJson(json.decode(str) as Map<String, dynamic>);

String userAuthToJson(UserAuth data) => json.encode(data.toJson());

class UserAuth {
  UserAuth({
    this.user,
  });

  User? user;

  UserAuth copyWith({
    User? user,
  }) =>
      UserAuth(
        user: user ?? this.user,
      );

  // ignore: sort_constructors_first
  static UserAuth fromJson(Map<String, dynamic> jsons) {
    return UserAuth(
      user: User.fromJson(jsons['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user!.toJson(),
      };
}

@HiveType(typeId: 0)
class User {
  User({
    this.id,
    this.email,
    this.password,
    this.name,
    this.token,
    this.groupUserId,
    this.userRoleId,
    this.groupUserName,
    this.userRoleName,
  });
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? token;
  @HiveField(5)
  int? groupUserId;
  @HiveField(6)
  int? userRoleId;
  @HiveField(7)
  String? groupUserName;
  @HiveField(8)
  String? userRoleName;

  User copyWith({
    int? id,
    String? email,
    String? password,
    String? name,
    String? token,
    int? groupUserId,
    int? userRoleId,
    String? groupUserName,
    String? userRoleName,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name,
        token: token ?? this.token,
        groupUserId: groupUserId ?? this.groupUserId,
        userRoleId: userRoleId ?? this.userRoleId,
        groupUserName: groupUserName ?? this.groupUserName,
        userRoleName: userRoleName ?? this.userRoleName,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int,
        email: json['email'].toString(),
        password: json['password'].toString(),
        name: json['name'].toString(),
        token: json['token'].toString(),
        groupUserId: json['group_user_id'] as int,
        userRoleId: json['user_role_id'] as int,
        groupUserName: json['group_user_name'].toString(),
        userRoleName: json['user_role_name'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
        'name': name,
        'token': token,
        'group_user_id': groupUserId,
        'user_role_id': userRoleId,
        'group_user_name': groupUserName,
        'user_role_name': userRoleName,
      };
}
