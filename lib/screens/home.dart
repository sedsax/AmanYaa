import 'package:amanyaa/screens/login.dart';
import 'package:amanyaa/screens/post_page.dart';
import 'package:flutter/material.dart';
import '../models/blog.dart';
import '../services/blog_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BlogService _blogService = BlogService();
  late Future<List<Blog>> _blogsFuture;

  @override
  void initState() {
    super.initState();
    _blogsFuture = _blogService.fetchBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Blog'),
        backgroundColor: const Color.fromARGB(255, 212, 153, 136),
        leading: const IconButton(
          onPressed: null,
          icon: Icon(Icons.person),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Çıkış'),
                    content:
                        const Text('Çıkış yapmak istediğinize emin misiniz?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Hayır'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text('Evet'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home_pg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: FutureBuilder<List<Blog>>(
          future: _blogsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'No blogs available.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              );
            } else {
              final blogs = snapshot.data!;
              return ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (context, index) {
                  final blog = blogs[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      title: Text(
                        blog.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(blog.content),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PostPage()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 212, 153, 136),
        child: const Icon(Icons.people),
      ),
    );
  }
}
