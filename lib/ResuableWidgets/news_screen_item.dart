import 'package:flutter/material.dart';

class NewsScreenItem extends StatelessWidget {
  const NewsScreenItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Flexible(
              flex: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000",
                  fit: BoxFit.contain,

                  // height: size.height / 5,
                  // width: size.width / 5,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'News Title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Text(
                    'News Title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
