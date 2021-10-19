import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_project/app/app.dart';
import 'package:take_home_project/home/home.dart';
import 'package:take_home_project/repositories/favorite_repository.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.id,
    required this.title,
    required this.authors,
    required this.smallThumbnail,
    required this.description,
  }) : super(key: key);

  final String id;
  final String title;
  final List<String>? authors;
  final String? smallThumbnail;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        titleSpacing: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocProvider(
              create: (context) =>
                  FavoriteBloc(favoriteRepository: FavoriteRepository())
                    ..add(LoadFavorite(user.id, id)),
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  if (state is FavoriteLoaded) {
                    final favorite = state.favorite;
                    return GestureDetector(
                        onTap: () => context
                            .read<FavoriteBloc>()
                            .add(UpdateFavorite(user.id, id)),
                        child: Icon(state.favorite
                            ? Icons.favorite
                            : Icons.favorite_border));
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: _image(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    authors == null ? 'No author' : 'by ${authors!.join(', ')}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  description ?? 'No description',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return smallThumbnail == null
        ? Image.asset(
            'assets/image-unavailable.png',
            height: 150,
            fit: BoxFit.cover,
          )
        : Image.network(
            smallThumbnail!,
            height: 150,
            fit: BoxFit.cover,
          );
  }
}
