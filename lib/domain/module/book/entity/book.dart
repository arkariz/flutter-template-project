import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final int number;
  final String title;
  final String originalTitle;
  final String releaseDate;
  final String description;
  final int pages;
  final String cover;
  final int index;

  const Book({
    required this.number,
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.description,
    required this.pages,
    required this.cover,
    required this.index,
  });

  @override
  List<Object> get props {
    return [
      number,
      title,
      originalTitle,
      releaseDate,
      description,
      pages,
      cover,
      index,
    ];
  }
}
