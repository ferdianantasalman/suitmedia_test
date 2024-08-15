import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'palindrome_event.dart';
part 'palindrome_state.dart';

class PalindromeBloc extends Bloc<PalindromeEvent, PalindromeState> {
  PalindromeBloc() : super(PalindromeInitial()) {
    on<PalindromeEventChecked>((event, emit) {
      emit(PalindromeStateLoading());
      var textWithoutSpace = event.text.replaceAll(' ', '').toLowerCase();
      var reversedText = textWithoutSpace.split('').reversed.join();
      if (textWithoutSpace == reversedText) {
        emit(const PalindromeStateSuccessChecked("is Palindrome"));
      } else {
        emit(const PalindromeStateError("not Palindrome"));
      }
    });
  }
}
