import 'dart:convert';

import '../models/news_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<newsModel> newsList = [];

  // api fetching
  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ac69be4d9a83424588f8980dd60eb8bd";

    var response =await http.get(Uri.parse(url));
    var jsonData  = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
            newsModel newsmodel = newsModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
             // publishedAt: element['publishedAt'],
              content: element['content']
            );
            newsList.add(newsmodel);

        }
      });
    }

  }
}


class categoryNews{
  List<newsModel> newsList = [];


  // api fetching
  Future<void> getNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=ac69be4d9a83424588f8980dd60eb8bd";

    var response =await http.get(Uri.parse(url));
    var jsonData  = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          newsModel newsmodel = newsModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              // publishedAt: element['publishedAt'],
              content: element['content']
          );
          newsList.add(newsmodel);

        }
      });
    }

  }
}