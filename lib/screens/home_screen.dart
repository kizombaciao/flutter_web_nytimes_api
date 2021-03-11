import 'package:flutter_web_nytimes_api/helpers/responsive_helper.dart';
import 'package:flutter_web_nytimes_api/models/article_model.dart';
import 'package:flutter_web_nytimes_api/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:nyc_website/services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  _fetchArticles() async {
    List<Article> articles =
        await APIService().fetchArticlesBySection('technology');
    setState(() {
      _articles = articles;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 80.0),
          Center(
            child: Text(
              'The New York Times\nTop Tech Articles',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
          SizedBox(height: 15.0),
          _articles.length > 0
              ? _buildArticlesGrid(mediaQuery)
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }
}
