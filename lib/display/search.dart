import 'package:flutter/material.dart';
import 'package:final_project_mobile/description.dart';

class SearchData extends SearchDelegate{
  final List data;
  SearchData({required this.data});

  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query="";
      })
    ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return
      IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
        Navigator.pop(context);
      });
  }
  @override
  Widget buildResults(BuildContext context) {
    return
      Container();
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    final list = query.isEmpty ? data : data.where((element) =>
        element['title'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                ClipRRect(
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500' + list[index]['poster_path'],
                    height: 115,
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[index]['title'] != null
                            ? list[index]['title']
                            : list[index]['name'],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        list[index]['release_date'] != null
                          ? list[index]['release_date']
                          : list[index]['first_air_date'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Description(
                  name: list[index]['title'] != null
                      ? list[index]['title']
                      : list[index]['name'],
                  header:
                  'https://image.tmdb.org/t/p/w500' + list[index]['backdrop_path'],
                  thumbnail:
                  'https://image.tmdb.org/t/p/w500' + list[index]['poster_path'],
                  description: list[index]['overview'],
                  vote: list[index]['vote_average'].toString(),
                  release: list[index]['release_date'] != null
                      ? list[index]['release_date']
                      : list[index]['first_air_date'],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}