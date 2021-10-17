import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:take_home_project/home/home.dart';
import 'package:take_home_project/repositories/book_repository.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc({required BookRepository bookRepository})
      : _bookRepository = bookRepository,
        super(const BookState.loading()) {
    on<FetchBooks>(_onFetchBooks);
  }

  Future<void> _onFetchBooks(FetchBooks event, Emitter<BookState> emit) async {
    try {
      final books = await _bookRepository.getBooks();
      emit(BookState.success(books));
    } catch (_) {
      emit(const BookState.failure());
    }
  }

  final BookRepository _bookRepository;
}
