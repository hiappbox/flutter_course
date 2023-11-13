import 'package:flutter/material.dart';
import 'package:flutter_course/article_app/add_article_form.dart';
import 'package:get/get.dart';

class ArticleAppScreen extends StatefulWidget {
  const ArticleAppScreen({super.key});

  @override
  State<ArticleAppScreen> createState() => _ArticleAppScreenState();
}

class _ArticleAppScreenState extends State<ArticleAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("flutter Article App"),
        centerTitle: true,
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            Get.to(const AddArticleForm());
          },
          icon: const CircleAvatar(
            radius: 16,
            backgroundColor: Colors.deepPurple,
            child: Icon(
              Icons.add,
              size: 24,
              color: Colors.white,
            ),
          )
      ),
    );
  }
}
