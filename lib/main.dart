import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alvin Pereira'),
        backgroundColor: Colors.lightGreen, // Mild green color
        actions: [
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Contact Info'),
                    content: Text('Phone: +55 (47) 99192-8980'),
                    actions: [
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Contact Info'),
                    content: Text('Email: cpalvin@outlook.com'),
                    actions: [
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SocialMediaLink(
              text: 'LinkedIn',
              url: 'https://www.linkedin.com/in/alvincpereira/',
              fontSize: 24.0,
            ),
            const SizedBox(height: 10),
            SocialMediaLink(
              text: 'GitHub',
              url: 'https://github.com/CarPA8974',
              fontSize: 24.0,
            ),
            const SizedBox(height: 10),
            SocialMediaLink(
              text: 'Resume',
              url: 'https://docs.google.com/document/d/1E9yayN8gYHIZok5vPVkj0P_OfBeDbUXyRflhYRICZzE/edit?usp=sharing',
              fontSize: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMediaLink extends StatelessWidget {
  final String text;
  final String url;
  final double fontSize;

  const SocialMediaLink({
    super.key,
    required this.text,
    required this.url,
    this.fontSize = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch $url')),
          );
        }
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}