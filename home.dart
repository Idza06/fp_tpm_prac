import 'package:flutter/material.dart';
import 'package:final_project_mobile/display/discover.dart';
import 'package:final_project_mobile/display/topRated.dart';
import 'package:final_project_mobile/display/trending.dart';
import 'package:final_project_mobile/display/tvShows.dart';
import 'package:final_project_mobile/display/search.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'display/watchList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apiKey = 'f3f35de332da3061368b0cf2472dd565';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmM2YzNWRlMzMyZGEzMDYxMzY4YjBjZjI0NzJkZDU2NSIsInN1YiI6IjY0NTllMzllMWI3MGFlMDE4N2UxMTRiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kAdliwrGERBvtwoP-52tcGtm4F97Vis88lcToNhaJyg';
  List discover = [];
  List trendingmovies = [];
  List topratedmovies = [];
  List tvshow = [];
  List<Map<String, dynamic>> watchlist = [];

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

    Map discoverResult = await tmdbCustomLogs.v3.discover.getMovies();
    Map trendingResult = await tmdbCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbCustomLogs.v3.tv.getPopular();

    setState(() {
      discover = discoverResult['results'];
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
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "App",
              style: TextStyle(
                fontSize: 30,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.search, size: 30, color: Colors.white),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchData(data: discover + trendingmovies + topratedmovies + tvshow),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/header.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 160,
                ),
                UserAccountsDrawerHeader(
                  accountName: Text('Final Project TPM'),
                  accountEmail: Text('fptm@practicum.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  // Add other drawer items here
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Implement logout functionality here
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          if (discover.isNotEmpty) DiscoverMovies(discover: discover),
          if (trendingmovies.isNotEmpty) TrendingMovies(trending: trendingmovies),
          if (topratedmovies.isNotEmpty) TopRatedMovies(toprated: topratedmovies),
          if (tvshow.isNotEmpty) TV(tv: tvshow),
        ],
      ),
    );
  }
}
