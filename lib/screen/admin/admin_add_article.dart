import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class AdminAddArticle extends StatefulWidget {
  const AdminAddArticle({Key? key}) : super(key: key);

  @override
  _AdminAddArticleState createState() => _AdminAddArticleState();
}

class _AdminAddArticleState extends State<AdminAddArticle> {
  final _titleController = TextEditingController();
  final _articleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xffff914d),
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            const SizedBox(height: 10),
            TextFieldCustom(
              label: 'Title',
              controller: _titleController,
              validator: _requiredValidator,
            ),
            const SizedBox(height: 10),
            TextFieldCustom(
                label: 'Text',
                controller: _articleController,
                validator: _requiredValidator),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                final article = Article(
                  title: _titleController.text,
                  article: _articleController.text,
                );
                createArticle(article);
                Navigator.pop(context);
              },
              child: const Text(
                'Upload',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: const Color((0xffff914d)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 120,
                  vertical: 17,
                ),
                textStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

String? _requiredValidator(String? text) {
  if (text == null || text.trim().isEmpty) {
    return 'This field is required';
  }
  return null;
}

Future createArticle(Article article) async {
  final docArticle = FirebaseFirestore.instance.collection('article').doc();
  article.id = docArticle.id;
  final json = article.toJson();
  await docArticle.set(json);
}

class Article {
  String id;
  final String title;
  final String article;

  Article({this.id = '', required this.title, required this.article});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'article': article,
      };

  static Article fromJson(Map<String, dynamic> json) => Article(
        id: json['id'],
        title: json['title'] ?? '',
        article: json['article'] ?? '',
      );
}
