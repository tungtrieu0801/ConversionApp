import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'event.dart';
import 'state.dart';

class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(TextUpdated(updatedText: '', hexText: '', base64Text: '', binaryText: '')) {
    on<TextChanged>((event, emit) {
      final String newText = event.newText;

      //convert to hex
      final hexText = newText.codeUnits.map((e) => e.toRadixString(16)).join('');

      //convert to Base64
      final base64Text  = base64.encode(utf8.encode(newText));

      //convert to Binary
      final binaryText = newText.codeUnits.map((e) => e.toRadixString(2)).join('');

      emit(TextUpdated(
        updatedText: newText,
        hexText: hexText,
        base64Text: base64Text,
        binaryText: binaryText,
      ));
    });
  }
}
