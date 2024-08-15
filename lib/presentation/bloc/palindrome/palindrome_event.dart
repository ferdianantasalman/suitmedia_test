part of 'palindrome_bloc.dart';

abstract class PalindromeEvent extends Equatable {
  const PalindromeEvent();

  @override
  List<Object> get props => [];
}

class PalindromeEventChecked extends PalindromeEvent {
  final String text;

  const PalindromeEventChecked({
    required this.text,
  });

  @override
  List<Object> get props => [text];
}
