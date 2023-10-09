import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/news_model.dart';

Future<List<NewsModel>?> getNews() async {
  List<NewsModel> news = [];
  try {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('news');
    QuerySnapshot querySnapshot = await collection.get();
    // Loop through the documents and access the data
    for (var i = 0; i < querySnapshot.size; i++) {
      DocumentSnapshot document = querySnapshot.docs[i];
      news.add(NewsModel.fromMap(document.data() as Map<String, dynamic>));
    }
    print(news.toString());
    return news;
  } catch (e) {
    log('Error getting data: $e');
    return null;
  }
  return news;
}
