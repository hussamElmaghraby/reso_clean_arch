// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// if two mobects contain the same data it will be equal using equatable.
class NumberTrivia extends Equatable {
  final String text;
  final int number;
  const NumberTrivia({
    required this.text,
    required this.number,
  });

  @override
  List<Object?> get props => [text, number];
}
