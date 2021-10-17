import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_project/home/home.dart';
import 'package:take_home_project/repositories/book_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookBloc(bookRepository: BookRepository())..add(FetchBooks()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTitle('Explore thousands of books on the go'),
            HomeSearchField(
              'Search for books...',
              controller: _textController,
            ),
            const HomeHeading('Famous Books'),
            Expanded(
              child: BlocBuilder<BookBloc, BookState>(
                builder: (context, state) {
                  switch (state.status) {
                    case BookStatus.loading:
                      return const HomeLoading();
                    case BookStatus.loaded:
                      return HomeBookList(books: state.books);
                    case BookStatus.failure:
                    default:
                      return const HomeError();
                  }
                },
              ),
            )
          ],
        ),
      ),
      drawer: const HomeDrawer(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      elevation: 0,
    );
  }
}
