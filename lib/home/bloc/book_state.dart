part of 'book_bloc.dart';

enum BookStatus { loading, loaded, failure }

class BookState extends Equatable {
  const BookState._({
    required this.status,
    this.books = const [],
  });

  const BookState.loading() : this._(status: BookStatus.loading);

  const BookState.success(List<Book> items)
      : this._(status: BookStatus.loaded, books: items);

  const BookState.failure() : this._(status: BookStatus.failure);

  final BookStatus status;
  final List<Book> books;

  @override
  List<Object> get props => [status, books];
}
