import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class SignUp extends StatelessWidget {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  void _register(BuildContext context) async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the stored credentials from SharedPreferences
    String? storedCredentialsJson = prefs.getString(username);

    if (storedCredentialsJson != null) {
      Map<String, dynamic> storedCredentials = jsonDecode(storedCredentialsJson);

      // Check if the username already exists in the database
      if (storedCredentials != null) {
        _errorMessage = 'Username already exists';
      }
    }

    if (_errorMessage.isEmpty) {
      // Store the new credentials in SharedPreferences
      Map<String, dynamic> newCredentials = {
        'username': username,
        'password': _hashPassword(password),
      };
      prefs.setString(username, jsonEncode(newCredentials));

      // Clear the form fields
      _usernameController.clear();
      _passwordController.clear();

      // Show a success message or navigate to a different screen
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Registration successful!'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }


  String _hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create a new account',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32.0),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: 175.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () => _register(context),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text('Register'),
              ),
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  _errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}