import 'package:flutter/material.dart';
import 'package:take_home_project/home/models/models.dart';
import 'package:take_home_project/home/widgets/widgets.dart';

class HomeBookList extends StatelessWidget {
  const HomeBookList({Key? key, required this.books}) : super(key: key);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final book = books[index];
          return HomeCard(book: book);
        },
        itemCount: books.length,
      ),
    );
  }
}
