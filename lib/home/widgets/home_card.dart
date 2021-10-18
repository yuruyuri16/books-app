import 'package:flutter/material.dart';
import 'package:take_home_project/home/home.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    final bookInfo = book.volumeInfo;
    return Card(
      elevation: 5,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => DetailPage(
              id: book.id,
              title: bookInfo.title,
              authors: bookInfo.authors,
              smallThumbnail: bookInfo.imageLinks?.smallThumbnail,
              description: bookInfo.description,
            ),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            children: [
              _bookImage(),
              const SizedBox(
                width: 20,
              ),
              _bookInfo()
            ],
          ),
        ),
      ),
    );
  }

  Widget _bookImage() {
    final bookInfo = book.volumeInfo;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: bookInfo.imageLinks == null
          ? Image.asset(
              'assets/image-unavailable.png',
              width: 100,
            )
          : Image.network(
              bookInfo.imageLinks!.smallThumbnail,
              width: 100,
              fit: BoxFit.cover,
            ),
    );
  }

  Widget _bookInfo() {
    final bookInfo = book.volumeInfo;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bookInfo.authors == null
                ? 'No author'
                : 'by ${bookInfo.authors!.join(', ')}',
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            bookInfo.title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          _showRating(),
          const SizedBox(height: 8),
          _showCategories()
        ],
      ),
    );
  }

  Widget _showRating() {
    final bookInfo = book.volumeInfo;

    if (bookInfo.averageRating == null) {
      return const Text(
        'No rating',
        style: TextStyle(fontSize: 10),
      );
    }
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.orange.shade300,
          size: 15,
        ),
        Text(
          bookInfo.averageRating.toString(),
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }

  Widget _showCategories() {
    final bookInfo = book.volumeInfo;

    if (bookInfo.categories == null) {
      return const Text(
        'No categories',
        style: TextStyle(
          fontSize: 9,
        ),
      );
    }
    return Wrap(
      children: bookInfo.categories!
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
                  style: const TextStyle(fontSize: 9, color: Colors.blue),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
