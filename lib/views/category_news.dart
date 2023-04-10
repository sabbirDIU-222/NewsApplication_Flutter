import 'package:flutter/material.dart';
import 'package:newsapiapp/helper/news.dart';
import 'package:newsapiapp/views/Home.dart';

import '../models/news_model.dart';

class CatogoryNews extends StatefulWidget {
  final String category;
  CatogoryNews({required this.category});

  @override
  State<CatogoryNews> createState() => _CatogoryNewsState();
}

class _CatogoryNewsState extends State<CatogoryNews> {
  List<newsModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  getNews() async {
    categoryNews categorynewsclass = categoryNews();
    await categorynewsclass.getNews(widget.category);
    articles = categorynewsclass.newsList;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.blue,
            )),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Text(
                    'news',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Details',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ],
        ),
        elevation: 0.0,
        actions: [
          Opacity(
            opacity: 0.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(
                Icons.save,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: _loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all( 15.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return BlogTile(
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          desc: articles[index].description,
                          url: articles[index].url,
                        );
                      }),
                ),
              ),
      ),
    );
  }
}
