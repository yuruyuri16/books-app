import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:take_home_project/home/models/models.dart';

class BooksRequestFailure implements Exception {}

class BooksNotFoundFailure implements Exception {}

class BookRepository {
  BookRepository({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'www.googleapis.com';
  final http.Client _httpClient;

  Future<List<Book>> getBooks() async {
    final bookRequest = Uri.https(
      _baseUrl,
      '/books/v1/volumes',
      <String, String>{'q': 'harry+potter+inauthor:rowling'},
    );

    final res = await _httpClient.get(bookRequest);

    if (res.statusCode != 200) {
      throw BooksRequestFailure();
    }

    final responseJson = jsonDecode(res.body) as Map<String, dynamic>;

    if (responseJson.isEmpty) {
      throw BooksNotFoundFailure();
    }
    final response = Response.fromJson(responseJson);
    return response.items;
  }

  Future<void> getBooksByName(String name) async {
    final bookRequest = Uri.https(
      _baseUrl,
      '/books/v1/volumes',
      <String, String>{'q': name},
    );
  }
}
