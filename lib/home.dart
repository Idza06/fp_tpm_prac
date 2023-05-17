import 'package:flutter/material.dart';
import 'package:final_project_mobile/widgets/topRated.dart';
import 'package:final_project_mobile/widgets/trending.dart';
import 'package:final_project_mobile/widgets/tvShows.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apiKey = 'f3f35de332da3061368b0cf2472dd565';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmM2YzNWRlMzMyZGEzMDYxMzY4YjBjZjI0NzJkZDU2NSIsInN1YiI6IjY0NTllMzllMWI3MGFlMDE4N2UxMTRiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kAdliwrGERBvtwoP-52tcGtm4F97Vis88lcToNhaJyg';
  List trendingmovies = [];
  List topratedmovies = [];
  List tvshow = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingResult = await tmdbCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingResult['results'];
      topratedmovies = topRatedResult['results'];
      tvshow = tvResult['results'];
    });
    print((tvshow));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Movies",
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "App",
              style: TextStyle(
                fontSize: 30,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          if (trendingmovies.isNotEmpty)
            TrendingMovies(trending: trendingmovies),
          if (topratedmovies.isNotEmpty)
            TopRatedMovies(toprated: topratedmovies),
          if (tvshow.isNotEmpty)
            TV(tv: tvshow),
        ],
      ),
    );
  }
}
