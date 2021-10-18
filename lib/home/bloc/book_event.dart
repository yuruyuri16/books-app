part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class FetchBooks extends BookEvent {}

class SearchBooks extends BookEvent {
  const SearchBooks(this.bookField);

  final String bookField;

  @override
  List<Object> get props => [bookField];
}
