import 'package:equatable/equatable.dart';

abstract class TextState extends Equatable {
  const TextState();

  @override
  List<Object> get props => [];
}

class TextUpdated extends TextState {
  final String updatedText;
  final String hexText;
  final String base64Text;
  final String binaryText;

  const TextUpdated({
    required this.updatedText,
    required this.hexText,
    required this.base64Text,
    required this.binaryText,
  });

  @override
  List<Object> get props => [updatedText, hexText, base64Text, binaryText];
}
