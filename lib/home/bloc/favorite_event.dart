part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavorite extends FavoriteEvent {
  const LoadFavorite(this.userId, this.bookId);

  final String userId;
  final String bookId;
}

class UpdateFavorite extends FavoriteEvent {
  const UpdateFavorite(this.userId, this.bookId);

  final String userId;
  final String bookId;
}
