import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:take_home_project/home/home.dart';
import 'package:take_home_project/repositories/book_repository.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc({required BookRepository bookRepository})
      : _bookRepository = bookRepository,
        super(const BookState.initial()) {
    on<FetchBooks>(_onFetchBooks);
    on<SearchBooks>(_onSearchBooks);
  }

  final BookRepository _bookRepository;

  Future<void> _onFetchBooks(FetchBooks event, Emitter<BookState> emit) async {
    try {
      emit(const BookState.loading());
      final books = await _bookRepository.getBooks();
      emit(BookState.success(books));
    } catch (_) {
      emit(const BookState.failure());
    }
  }

  Future<void> _onSearchBooks(
      SearchBooks event, Emitter<BookState> emit) async {
    try {
      emit(const BookState.loading());
      final books = await _bookRepository.getBooksByName(event.bookField);
      emit(BookState.success(books));
    } catch (_) {
      emit(const BookState.failure());
    }
  }
}
