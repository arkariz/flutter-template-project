import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RequestBook extends Equatable {
  int? index;
  int? pageLimit;
  int? page;
  String? search;

  RequestBook({
    this.index,
    this.pageLimit,
    this.page,
    this.search,
  });

  Map<String, dynamic> toJson() => {
    if(index != null) "index": index,
    if(pageLimit != null) "max": pageLimit,
    if(page != null) "page": page,
    if(search != null) "search": search,
  };
  
  @override
  List<Object?> get props => [
    index,
    pageLimit,
    page,
    search,
  ];
}