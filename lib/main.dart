import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart'; // Required for Clipboard

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _showContactDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  content,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: content));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$title copied to clipboard!')),
                  );
                },
              ),
            ],
          ),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alvin Pereira'),
        backgroundColor: Colors.lightGreen,
        actions: [
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () => _showContactDialog(
              context,
              'Phone',
              '+55 (47) 99192-8980',
            ),
          ),
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () => _showContactDialog(
              context,
              'Email',
              'cpalvin@outlook.com',
            ),
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
            ),
            const SizedBox(height: 10),
            SocialMediaLink(
              text: 'GitHub',
              url: 'https://github.com/CarPA8974',
            ),
            const SizedBox(height: 10),
            SocialMediaLink(
              text: 'Resume',
              url: 'https://docs.google.com/document/d/1E9yayN8gYHIZok5vPVkj0P_OfBeDbUXyRflhYRICZzE/edit?usp=sharing',
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

  Future<void> _launchUrl(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _launchUrl(url, context),
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
