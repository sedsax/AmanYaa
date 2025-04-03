class Blog {
  final String title;
  final String content;
  final String id;

  Blog({required this.title, required this.content, required this.id});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      title: json['title'] as String,
      content: json['content'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'id': id,
    };
  }
}