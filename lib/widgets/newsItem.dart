import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../newsDetail_screen.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.firstContent,
    required this.snapshot,
    required this.index,
  });

  final String firstContent;
  final AsyncSnapshot<dynamic> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  NewsDetailScreen(data: snapshot.data[index]),
            ),
          );
        },
        child: Stack(
          children: [
            Hero(
              tag: snapshot.data![index]["id"],
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          snapshot.data![index]["thumbnail"],
                        ),
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                          Colors.black45,
                          BlendMode.darken,
                        )),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: 0,
              child: ZoomIn(
                duration: const Duration(
                  milliseconds: 400,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data![index]["title"],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        firstContent.substring(
                          0,
                          firstContent.indexOf("."),
                        ),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
