import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile Settings'),
            onTap: () {
              final snackBar = SnackBar(
                content: const Text('Selamat, anda kena jebakan Batman!'),
                action: SnackBarAction(
                  label: 'Anjir...',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification Settings'),
            onTap: () {
              final snackBar = SnackBar(
                content: const Text('Selamat, anda kena jebakan Batman!'),
                action: SnackBarAction(
                  label: 'Anjir...',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Security Settings'),
            onTap: () {
              final snackBar = SnackBar(
                content: const Text('Selamat, anda kena jebakan Batman!'),
                action: SnackBarAction(
                  label: 'Anjir...',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language Settings'),
            onTap: () {
              final snackBar = SnackBar(
                content: const Text('Selamat, anda kena jebakan Batman!'),
                action: SnackBarAction(
                  label: 'Anjir...',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Theme Settings'),
            onTap: () {
              // Handle theme settings tap
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {
              final snackBar = SnackBar(
                content: const Text('Selamat, anda kena jebakan Batman!'),
                action: SnackBarAction(
                  label: 'Anjir...',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          // Add more list items for other settings options
        ],
      ),
    );
  }
}
