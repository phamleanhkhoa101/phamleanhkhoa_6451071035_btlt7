import 'package:phamleanhkhoa_6451070135_btlt7/cau3/data/models/post.dart';
import 'package:phamleanhkhoa_6451070135_btlt7/cau3/data/services/post_service.dart';

class PostRepository {
  final PostService _postService;
  PostRepository(this._postService);

  Future<Post> createPost({
   required String title,
   required String body,
   required int userId
  }) async {
    final data = await _postService.createPost(
        title: title,
        body: body,
        userId: userId
    );
    return Post.formJson(data);
  }
}