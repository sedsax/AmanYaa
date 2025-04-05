class UserPost {
  final String createdAt;
  final String name;
  final String avatar;
  final String content;
  final String id;

  UserPost({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.content,
    required this.id,
  });

  factory UserPost.fromJson(Map<String, dynamic> json) {
    return UserPost(
      createdAt: json['createdAt'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      content: json['content'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'name': name,
      'avatar': avatar,
      'content': content,
      'id': id,
    };
  }
}
