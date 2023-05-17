import 'package:flutter/material.dart';
import 'package:final_project_mobile/tools/text.dart';
import '../description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textUpdate(
            text: 'Trending Movies',
            size: 24,
            color: Colors.white,
          ),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: trending[index]['title'],
                          header: 'https://image.tmdb.org/t/p/w500' +
                              trending[index]['backdrop_path'],
                          thumbnail: 'https://image.tmdb.org/t/p/w500' +
                              trending[index]['poster_path'],
                          description: trending[index]['overview'],
                          vote: trending[index]['vote_average'].toString(),
                          release: trending[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child:
                  trending[index]['title'] != null ?
                  Container(
                    width: 140,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path'],
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
                            text: trending[index]['title'] != null
                                ? trending[index]['title']
                                : 'Loading',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ): Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
