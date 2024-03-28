class Post {
  final int id;
  final String username;
  final String userImageUrl;
  final String location;
  final String imageUrl;
  final String description;
  int likes;
  final List<String> comments;
  bool isLiked;

  Post({
    required this.id,
    required this.username,
    required this.userImageUrl,
    required this.location,
    required this.imageUrl,
    required this.description,
    required this.likes,
    required this.comments,
    this.isLiked = false,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: int.tryParse(json['id'].toString()) ?? 0,
      username: json['username'] ?? '',
      userImageUrl: json['userImageUrl'] ?? '',
      location: json['location'] ?? '',
      imageUrl: json['imageurl'] ?? '',
      description: json['description'] ?? '',
      likes: int.tryParse(json['likes'].toString()) ?? 0,
      comments: List<String>.from(json['comments'] ?? []),
    );
  }
}
