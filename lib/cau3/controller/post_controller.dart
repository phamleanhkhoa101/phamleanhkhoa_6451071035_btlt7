import 'package:phamleanhkhoa_6451070135_btlt7/cau3/data/models/post.dart';
import 'package:phamleanhkhoa_6451070135_btlt7/cau3/data/repository/post_repository.dart';
import 'package:phamleanhkhoa_6451070135_btlt7/cau3/data/services/post_service.dart';

class PostController {
  late final PostRepository _postRepository;
  PostController (){
    _postRepository = PostRepository(PostService());
  }

  Future<Post> createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    return await _postRepository.createPost(
        title: title,
        body: body,
        userId: userId
    );
  }
}