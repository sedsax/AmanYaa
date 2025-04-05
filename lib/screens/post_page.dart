import 'package:flutter/material.dart';
import '../models/user_post.dart';
import '../services/blog_service.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final BlogService _blogService = BlogService();
  late Future<List<UserPost>> _userPostsFuture;

  @override
  void initState() {
    super.initState();
    _userPostsFuture = _blogService.fetchUserPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Followers'),
        backgroundColor: const Color.fromARGB(255, 212, 153, 136),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home_pg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: FutureBuilder<List<UserPost>>(
          future: _userPostsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No posts available.'));
            } else {
              final userPosts = snapshot.data!;
              return ListView.builder(
                itemCount: userPosts.length,
                itemBuilder: (context, index) {
                  final post = userPosts[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(post.avatar),
                      ),
                      title: Text(post.name),
                      subtitle: Text(post.content),
                      trailing: Text(
                        post.createdAt.split('T')[0],
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
