import 'package:amanyaa/screens/login.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Blog'),
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
                    content: const Text('Çıkış yapmak istediğinize emin misiniz?'),
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildExpandableBlogPost(
            title: 'Flutter Basics',
            content: 'Learn the basics of Flutter development.',
          ),
          _buildExpandableBlogPost(
            title: 'State Management',
            content:
                'Explore different state management techniques in Flutter.',
          ),
          _buildExpandableBlogPost(
            title: 'Building Responsive UIs',
            content:
                'Building responsive UIs in Flutter is essential for creating applications that look great on devices of all sizes. '
                'Flutter provides several tools and techniques to help developers achieve responsiveness. '
                'One of the most commonly used tools is the MediaQuery class, which allows you to retrieve information about the size and orientation of the screen. '
                'For example, you can use MediaQuery to adjust padding, margins, or font sizes based on the screen width.\n\n'
                'Another powerful tool is the LayoutBuilder widget, which provides the constraints of its parent widget. '
                'This allows you to build adaptive layouts that change based on the available space. '
                'For instance, you can create a grid layout that switches from two columns to one column on smaller screens.\n\n'
                'Flutter also supports Flex widgets like Row and Column, which can be combined with the Expanded and Flexible widgets to create dynamic layouts. '
                'These widgets allow you to allocate space proportionally or adaptively, ensuring that your UI elements adjust gracefully to different screen sizes.\n\n'
                'Additionally, you can use the FractionallySizedBox widget to size elements as a fraction of their parent\'s size, '
                'or the AspectRatio widget to maintain a consistent aspect ratio for your UI components.\n\n'
                'For more advanced responsiveness, consider using packages like flutter_screenutil or responsive_builder, '
                'which provide utilities for scaling and adapting your UI across various devices. '
                'By combining these tools and techniques, you can create Flutter applications that deliver a seamless user experience on any device.',
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableBlogPost(
      {required String title, required String content}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(content),
          ),
        ],
      ),
    );
  }
}
