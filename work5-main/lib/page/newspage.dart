// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'package:apiapp/components/drawer.dart';
import 'package:apiapp/page/welcome.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:apiapp/model/news.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  List<NewsThailand> newsList = [];
  Future<List<NewsThailand>> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=th&category=business&apiKey=6ff8189dff8a4008b821ef746ba6ef74'));
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      List<dynamic> articles = responseJson['articles'];
      newsList = articles.map((m) => NewsThailand.fromJson(m)).toList();
      return newsList;
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Get.to(WelcomeScreen()),
              icon: Icon(
                Icons.home,
                size: 25,
              ))
        ],
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 243, 128, 19),
        centerTitle: true,
        title: Text(
          'ช่าว สด ใหม่',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: DrawerNav(
        color: Color.fromARGB(255, 243, 128, 19),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: FutureBuilder(
          future: fetchNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      child: Card(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  newsList[index].title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    'ผู้เขียน ' + newsList[index].author,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.ads_click_rounded),
                                          Text(
                                            'อ่านข่าว',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 16,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        newsList[index].publishedAt,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Text('error');
            }
          },
        ),
      ),
    );
  }
}
