import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/admin/admin_add_article.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_article_details.dart';

class PetOwnerArticles extends StatefulWidget {
  const PetOwnerArticles({Key? key}) : super(key: key);

  @override
  State<PetOwnerArticles> createState() => _PetOwnerArticlesState();
}

class _PetOwnerArticlesState extends State<PetOwnerArticles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xffff914d),
        elevation: 0,
      ),
      body: StreamBuilder<List<Article>>(
          stream: readArticle(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong ${snapshot.error}');
            } else if (snapshot.hasData) {
              final articles = snapshot.data!;

              return ListView(
                children: articles.map(buildArticle).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget buildArticle(Article article) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xff36ced4),
          child: Icon(
            Icons.article,
            color: Colors.white,
          ),
        ),
        title: Text(
          article.title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Color(0xffff914d),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PetOwnerArticleDetails(article: article)));
        },
      );

  Stream<List<Article>> readArticle() => FirebaseFirestore.instance
      .collection('article')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Article.fromJson(doc.data())).toList());
}
