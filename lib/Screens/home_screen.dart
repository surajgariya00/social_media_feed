import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:social_media_feed/API/api_calling.dart';
import 'package:social_media_feed/Components/feed_card.dart';
import 'package:social_media_feed/Data/dummy_daata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.blue[200],
        title: const Text(
          'Social Media Feed',
          style: TextStyle(
            color: Color.fromARGB(255, 49, 45, 45),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Post>>(
        future: PostApiProvider.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.blue[50],
              strokeWidth: 2,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return AnimatedPostCard(posts[index]);
              },
            );
          }
        },
      ),
    );
  }
}
