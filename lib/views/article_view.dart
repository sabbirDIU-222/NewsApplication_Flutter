import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleViewBlog extends StatefulWidget {
  final String? posturl;
  ArticleViewBlog({required this.posturl});

  @override
  State<ArticleViewBlog> createState() => _ArticleViewBlogState();
}

class _ArticleViewBlogState extends State<ArticleViewBlog> {
  late final WebViewController _controller;
  late final String url;

  @override
  void initState() {
    super.initState();
    url = widget.posturl!;
    _controller = WebViewController()..loadRequest(Uri.parse(url));
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: WebViewWidget(
              controller: _controller,
            )));
  }
}
