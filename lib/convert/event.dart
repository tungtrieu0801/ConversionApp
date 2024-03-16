import 'package:equatable/equatable.dart';

abstract class TextEvent extends Equatable {
  const TextEvent();

  @override
  List<Object?> get props => [];
}

class TextChanged extends TextEvent {
  final String newText;
  final String? base64Text;
  final String? binaryText;

  const TextChanged({
    required this.newText,
    this.base64Text,
    this.binaryText,
  });

  @override
  List<Object?> get props => [newText, base64Text, binaryText];
}
