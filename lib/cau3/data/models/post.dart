class Post {
  final int? id;
  final String title;
  final String body;
  final int userId;

  Post({
    this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  Map<String, dynamic> toJson(){
    return {
      'title': title ,
      'body': body,
      'userId': userId,
    };
  }

  factory Post.formJson(Map<String, dynamic> json){
    return Post(
      id: int.tryParse('${json['id']}'),
      title: json['title']?.toString() ?? '',
      body: json['body']?.toString() ?? '',
      userId: int.tryParse('${json['userId']}') ?? 0,
    );
  }
}