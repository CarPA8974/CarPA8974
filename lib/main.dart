import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'alvinpereira.dev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 189, 242, 161)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'alvinpereira.dev'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
              url:
                  'https://docs.google.com/document/d/1E9yayN8gYHIZok5vPVkj0P_OfBeDbUXyRflhYRICZzE/edit?usp=sharing',
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

  const SocialMediaLink({
    super.key,
    required this.text,
    required this.url,
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
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}