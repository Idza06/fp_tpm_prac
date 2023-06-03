import 'package:flutter/material.dart';
import 'package:final_project_mobile/tools/text.dart';
import '../description.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textUpdate(
            text: 'Popular TV Shows',
            size: 24,
            color: Colors.white,
          ),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: tv[index]['name'],
                          header: 'https://image.tmdb.org/t/p/w500' +
                              tv[index]['backdrop_path'],
                          thumbnail: 'https://image.tmdb.org/t/p/w500' +
                              tv[index]['poster_path'],
                          description: tv[index]['overview'],
                          vote: tv[index]['vote_average'].toString(),
                          release: tv[index]['first_air_date'],
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
                                      tv[index]['poster_path'],
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
                            text: tv[index]['name'] != null
                                ? tv[index]['name']
                                : 'Loading',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
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