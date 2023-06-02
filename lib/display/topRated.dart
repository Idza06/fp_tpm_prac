import 'package:flutter/material.dart';
import 'package:final_project_mobile/tools/text.dart';
import '../description.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textUpdate(
            text: 'Top Rated Movies',
            size: 24,
            color: Colors.white,
          ),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: toprated[index]['title'],
                          header: 'https://image.tmdb.org/t/p/w500' +
                              toprated[index]['backdrop_path'],
                          thumbnail: 'https://image.tmdb.org/t/p/w500' +
                              toprated[index]['poster_path'],
                          description: toprated[index]['overview'],
                          vote: toprated[index]['vote_average'].toString(),
                          release: toprated[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    child: Padding(
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
                                      toprated[index]['poster_path'],
                                ),
                              ),
                            ),
                            height: 200,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: textUpdate(
                            size: 15,
                            text: toprated[index]['title'] != null
                                ? toprated[index]['title']
                                : 'Loading',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}