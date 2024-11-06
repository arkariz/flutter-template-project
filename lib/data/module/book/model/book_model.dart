import 'package:project_template/domain/module/book/entity/book.dart';

class BooksModel {
  List<BookModel>? books;

  BooksModel({
    this.books,
  });

  factory BooksModel.fromJson(List<dynamic> json) => BooksModel(
    books: json.map((x) => BookModel.fromJson(x)).toList(),
  );

  List<Book> toEntity() => books?.map((element) => element.toEntity()).toList() ?? [];
}

class BookModel {
  int? number;
  String? title;
  String? originalTitle;
  String? releaseDate;
  String? description;
  int? pages;
  String? cover;
  int? index;

  BookModel({
    this.number,
    this.title,
    this.originalTitle,
    this.releaseDate,
    this.description,
    this.pages,
    this.cover,
    this.index,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    number: json["number"],
    title: json["title"],
    originalTitle: json["originalTitle"],
    releaseDate: json["releaseDate"],
    description: json["description"],
    pages: json["pages"],
    cover: json["cover"],
    index: json["index"],
  );

  Book toEntity() => Book(
    number: number ?? 0,
    title: title ?? "",
    originalTitle: originalTitle ?? "",
    releaseDate: releaseDate ?? "",
    description: description ?? "",
    pages: pages ?? 0,
    cover: cover ?? "",
    index: index ?? 0,
  );
}
