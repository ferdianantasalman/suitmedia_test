import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  List<Object?> get props => [
        email,
        firstName,
        lastName,
        avatar,
      ];
}
