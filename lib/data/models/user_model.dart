import 'package:json_annotation/json_annotation.dart';
import 'package:suitmedia/domain/entities/user.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  @override
  final String? email;
  @JsonKey(name: "first_name")
  @override
  final String? firstName;
  @JsonKey(name: "last_name")
  @override
  final String? lastName;
  @override
  final String? avatar;

  UserModel({
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  }) : super(
            email: email,
            firstName: firstName,
            lastName: lastName,
            avatar: avatar);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
