import 'package:flutter/material.dart';
import 'package:final_project_mobile/tools/text.dart';
import '../description.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DiscoverMovies extends StatelessWidget {
  final List discover;

  const DiscoverMovies({Key? key, required this.discover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textUpdate(
            text: 'Discover Movies',
            size: 24,
            color: Colors.white,
          ),
          SizedBox(height: 25),
          CarouselSlider(
            options: CarouselOptions(
              height: 310,
              autoPlay: true, // Enable auto-playing of slides
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 16 / 9,
              autoPlayInterval: Duration(seconds: 5), // Set the auto-play interval
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: discover.map((item) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Description(
                        name: item['title'],
                        header: 'https://image.tmdb.org/t/p/w500' +
                            item['backdrop_path'],
                        thumbnail: 'https://image.tmdb.org/t/p/w500' +
                            item['poster_path'],
                        description: item['overview'],
                        vote: item['vote_average'].toString(),
                        release: item['release_date'],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 480,
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    item['backdrop_path'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 230,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: textUpdate(
                          size: 20,
                          text: item['title'] != null
                              ? item['title']
                              : 'Loading',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}