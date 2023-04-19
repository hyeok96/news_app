import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'widgets/newsItem.dart';

class NewsHomeScreen extends StatefulWidget {
  const NewsHomeScreen({super.key});

  @override
  State<NewsHomeScreen> createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
  var dio = Dio();

  Future? _newsList() async {
    var res =
        await dio.get("http://52.79.115.43:8090/api/collections/news/records");
    if (res.data != null) {
      return res.data!["items"];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: _newsList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (context, index) {
                var firstContent = snapshot.data![index]["content"].toString();
                return NewsItem(
                  firstContent: firstContent,
                  snapshot: snapshot,
                  index: index,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemCount: snapshot.data!.length,
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
