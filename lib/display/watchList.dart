/*
import 'package:final_project_mobile/display/watchListCard.dart';
import 'package:flutter/material.dart';
import 'package:final_project_mobile/description.dart';
import 'package:provider/provider.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    List<Movie> watchlist = movieProvider.watchlist;

    return Visibility(
      visible: watchlist.isNotEmpty,
      replacement: const Center(
        child: Text("Your watchlist is empty"),
      ),
      child: ListView.builder(
        itemCount: watchlist.length,
        itemBuilder: (context, index) => WatchlistCard(movie: watchlist[index]),
      ),
    );
  }
}

import 'dart:convert';
import 'package:final_project_mobile/description.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchlistPage extends StatefulWidget {
  final List<Map<String, dynamic>>? watchlist;

  WatchlistPage({required this.watchlist});

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  List<Map<String, dynamic>> watchlist = [];

  @override
  void initState() {
    super.initState();
    loadWatchlist();
  }

  loadWatchlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? watchlistJson = prefs.getString('watchlist');
    if (watchlistJson != null) {
      setState(() {
        watchlist = jsonDecode(watchlistJson).cast<Map<String, dynamic>>();
      });
    }
  }

  void onBookmarkStatusChanged(String movieName, bool isBookmarked) {
    if (isBookmarked) {
      // Add the movie to the watchlist
      SharedPreferences.getInstance().then((prefs) {
        List<Map<String, dynamic>> updatedWatchlist = [...watchlist];
        updatedWatchlist.add({'name': movieName});
        prefs.setString('watchlist', jsonEncode(updatedWatchlist));
        setState(() {
          watchlist = updatedWatchlist;
        });
      });
    } else {
      // Remove the movie from the watchlist
      SharedPreferences.getInstance().then((prefs) {
        List<Map<String, dynamic>> updatedWatchlist = [...watchlist];
        updatedWatchlist.removeWhere((movie) => movie['name'] == movieName);
        prefs.setString('watchlist', jsonEncode(updatedWatchlist));
        setState(() {
          watchlist = updatedWatchlist;
        });
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    final bookmarkedMovies = watchlist.where((item) => item['isBookmarked'] == true).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
      ),
      body: bookmarkedMovies.isEmpty
          ? Center(
        child: Text(
          'No bookmarked movies',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
          : ListView.builder(
        itemCount: bookmarkedMovies.length,
        itemBuilder: (context, index) {
          final item = bookmarkedMovies[index];
          final String posterPath = item['poster_path'] ?? '';
          final String backdropPath = item['backdrop_path'] ?? '';

          return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Description(
                      name: item['title'] as String? ?? item['name'] as String? ?? '',
                      header: 'https://image.tmdb.org/t/p/w500$backdropPath',
                      thumbnail: 'https://image.tmdb.org/t/p/w500$posterPath',
                      description: item['overview'] as String? ?? '',
                      vote: item['vote_average'].toString(),
                      release: item['release_date'] as String? ?? item['first_air_date'] as String? ?? '',
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500$posterPath',
                        height: 115,
                        fit: BoxFit.fitWidth,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return Container(
                            width: 115,
                            height: 115,
                            color: Colors.grey, // Placeholder color
                          );
                        },
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'] as String? ?? item['name'] as String? ?? '',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            item['release_date'] as String? ?? item['first_air_date'] as String? ?? '',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.bookmark, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
*/