import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../ResuableWidgets/copy_button.dart';
import '../ResuableWidgets/custom_text.dart';
import '../ResuableWidgets/share_button.dart';
import '../presentation/styles/colours.dart';

class LocalNewsCard {
  String title;
  String ImagePath;
  String body;
  LocalNewsCard({
    required this.title,
    required this.ImagePath,
    required this.body,
  });
}

//This card create for get news
class NewsCard extends StatelessWidget {
  NewsCard({Key? key, required this.news}) : super(key: key);

  NewsDataModel news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () {
          // open news page to view news details
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => NewsItemScreen(news: news),
          //     ));
        },
        //news conetnt : title + body + image + share and copy buttons
        child: Hero(
          tag: news.title!,
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                //news image
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    image:
                        DecorationImage(image: news.image!, fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                //card gradient
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.15)),

                  //card content : news title + copy and share buttons + news body
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //news title + copy and share buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //news title
                              CustomText(
                                  text: news.title!,
                                  weight: FontWeight.w600,
                                  fontSize: 25),

                              //copy and share buttons container
                              Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      //share button
                                      ShareButton(
                                        link: news.linkUrl!,
                                        title: news.title!,
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Container(
                                          height: 25,
                                          width: 1,
                                          color: white.withOpacity(0.5),
                                        ),
                                      ),

                                      //copy button
                                      CopyButton(link: news.linkUrl!),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          //news body
                          CustomText(
                              text: getCardContent(news.body!),
                              weight: FontWeight.w300,
                              fontSize: 18)
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //reduce news body text for the card
  String getCardContent(String content) {
    return content.length > 70 ? '${content.substring(0, 70)}...' : content;
  }
}

class NewsModel {
  String? code;
  String? message;
  List<NewsDataModel> news = [];

  NewsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    for (Map<String, dynamic> json in json['data']) {
      news.add(NewsDataModel.fromJson(json));
    }
  }
}

class NewsDataModel {
  int? id;
  String? date;
  String? body;
  NetworkImage? image;
  String? linkUrl;
  String? title;

  NewsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    body = json['body'];
    image = json['imageUrl'];
    linkUrl = json['linkUrl'];
    title = json['title'];
  }
}
