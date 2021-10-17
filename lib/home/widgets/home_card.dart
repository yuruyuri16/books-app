import 'package:flutter/material.dart';
import 'package:take_home_project/home/models/models.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                book.volumeInfo.imageLinks.smallThumbnail,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'by ${book.volumeInfo.authors.join(',')}',
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    book.volumeInfo.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  _showRating(),
                  const SizedBox(height: 8),
                  _showCategories()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _showRating() {
    if (book.volumeInfo.averageRating == null) return const Text('No rating');
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.orange.shade300,
          size: 15,
        ),
        Text(
          book.volumeInfo.averageRating.toString(),
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }

  Widget _showCategories() {
    if (book.volumeInfo.categories == null) return const Text('No categories');
    return Wrap(
      children: book.volumeInfo.categories!
          .map(
            (e) => Container(
              height: 20,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(144, 224, 255, 1),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Align(
                widthFactor: 1,
                child: Text(
                  e,
                  style: const TextStyle(fontSize: 9),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
