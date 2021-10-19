import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_home_project/home/home.dart';

class FavoriteRepository {
  FavoriteRepository({FirebaseFirestore? fireStore})
      : _fireStore = fireStore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _fireStore;

  Future<bool> loadFavorite(String userId, String bookId) async {
    final ref = _fireStore
        .collection('users')
        .doc(userId)
        .withConverter<UserInfo>(
          fromFirestore: (snapshot, _) => UserInfo.fromJson(snapshot.data()!),
          toFirestore: (userInfo, _) => userInfo.toJson(),
        );

    final snapshot = await ref.get();

    if (!snapshot.exists) {
      await ref.set(UserInfo([]));
      return false;
    }

    if (snapshot.data()!.favorites.contains(bookId)) return true;

    return false;
  }

  Future<void> updateFavorite(String userId, String bookId) async {
    final ref = _fireStore
        .collection('users')
        .doc(userId)
        .withConverter<UserInfo>(
          fromFirestore: (snapshot, _) => UserInfo.fromJson(snapshot.data()!),
          toFirestore: (userInfo, _) => userInfo.toJson(),
        );
    final snapshot = await ref.get();

    if (!snapshot.exists) {
      return ref.set(UserInfo([bookId]));
    }
    if (snapshot.data()!.favorites.contains(bookId)) {
      await ref.update({
        'favorites': FieldValue.arrayRemove(<String>[bookId])
      });
    } else {
      await ref.update({
        'favorites': FieldValue.arrayUnion(<String>[bookId])
      });
    }
  }
}
