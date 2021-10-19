import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:take_home_project/repositories/favorite_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc({required FavoriteRepository favoriteRepository})
      : _favoriteRepository = favoriteRepository,
        super(FavoriteLoading()) {
    on<LoadFavorite>(_onLoadFavorite);
    on<UpdateFavorite>(_onUpdateFavorite);
  }

  final FavoriteRepository _favoriteRepository;

  // couldn't make it with snapshots
  Future<void> _onLoadFavorite(
      LoadFavorite event, Emitter<FavoriteState> emit) async {
    final favorite =
        await _favoriteRepository.loadFavorite(event.userId, event.bookId);
    emit(FavoriteLoaded(favorite));
  }

  void _onUpdateFavorite(UpdateFavorite event, Emitter<FavoriteState> emit) {
    _favoriteRepository.updateFavorite(event.userId, event.bookId);
  }
}
