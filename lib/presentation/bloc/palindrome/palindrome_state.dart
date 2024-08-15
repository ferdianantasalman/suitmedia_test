part of 'palindrome_bloc.dart';

abstract class PalindromeState extends Equatable {
  const PalindromeState();

  @override
  List<Object?> get props => [];
}

class PalindromeInitial extends PalindromeState {
  @override
  List<Object?> get props => [];
}

class PalindromeStateLoading extends PalindromeState {
  @override
  List<Object?> get props => [];
}

class PalindromeStateError extends PalindromeState {
  final String message;

  const PalindromeStateError(this.message);
  @override
  List<Object?> get props => [
        message,
      ];
}

class PalindromeStateSuccessChecked extends PalindromeState {
  final String message;

  const PalindromeStateSuccessChecked(this.message);
  @override
  List<Object?> get props => [
        message,
      ];
}
