import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Welcome to our Movie API app! We are a team of developers consisting of Alfa Aditya Wicaksana and Qibran Idza Lafandzi, who are dedicated to creating innovative and user-friendly solutions.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('praktpm@upnyk.com'),
              onTap: () {
                final snackBar = SnackBar(
                  content: const Text('This email does not exist, obviously.'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('911'),
              onTap: () {
                final snackBar = SnackBar(
                  content: const Text('Ring-A-Ding-Ding!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('Earth'),
              onTap: () {
                final snackBar = SnackBar(
                  content: const Text('We are located in Yogyakarta, if you can believe that'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        ),
      ),
    );
  }
}