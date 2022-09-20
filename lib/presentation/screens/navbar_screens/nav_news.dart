import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ResuableWidgets/custom_text.dart';
import '../../../ResuableWidgets/news_screen_item.dart';
import '../../../business_logic/news_cubit.dart';
import '../../../models/news_model.dart';
import '../../styles/colours.dart';

class NewsScreen extends StatelessWidget {
  List<LocalNewsCard> localNewsCards = [
    LocalNewsCard(
      title: 'News 1',
      ImagePath:
          "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000",
      body: 'testing',
    ),
    LocalNewsCard(
      title: 'News 2',
      ImagePath:
          "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000",
      body: 'testing2',
    ),
    LocalNewsCard(
      title: 'News 3',
      ImagePath:
          "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000",
      body: 'testing3',
    ),
    LocalNewsCard(
      title: 'News 4',
      ImagePath:
          "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000",
      body: 'testing4',
    ),
    LocalNewsCard(
      title: 'News 5',
      ImagePath:
          "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000",
      body: 'testing5',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        NewsCubit myCubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: CustomText(
              text: "News",
              fontSize: 28,
              weight: FontWeight.w500,
              textColor: Colors.black,
            ),
          ),
          body: ConditionalBuilder(
            condition:
                myCubit.newsModel != null && myCubit.newsModel!.news.isNotEmpty,
            builder: (context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  SizedBox(height: 8),
                  Expanded(
                      child: ListView.builder(
                    itemCount: myCubit.newsModel!.news.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                        news: myCubit.newsModel!.news[index],
                      );
                    },
                  ))
                ]),
              );
            },
            fallback: (context) {
              // return const Center(
              //   child: CircularProgressIndicator(
              //     color: primaryColor,
              //   ),
              // );
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.separated(
                    itemBuilder: (context, index) => NewsScreenItem(
                          body: localNewsCards[index].body,
                          title: localNewsCards[index].title,
                          imagePath: localNewsCards[index].ImagePath,
                        ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: 5),
              );
            },
          ),
        );
      },
    );
  }
}
