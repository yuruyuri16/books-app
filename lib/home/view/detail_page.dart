import 'package:flutter/material.dart';

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
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: _image(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
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
                  description == null ? 'No description' : description!,
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
