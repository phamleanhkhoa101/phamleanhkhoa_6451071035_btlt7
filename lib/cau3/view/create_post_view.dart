import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phamleanhkhoa_6451070135_btlt7/cau3/controller/post_controller.dart';
import 'package:phamleanhkhoa_6451070135_btlt7/cau3/data/models/post.dart';

class CreatePostView extends StatefulWidget{
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView>{
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  final PostController _postController = PostController();

  bool _isLoading = false;
  String _message = '';
  String _responseText = '';

  Future<void> _createPost() async{
    final title =  _titleController.text.trim();
    final body =  _bodyController.text.trim();

    if (title.isEmpty || body.isEmpty) {
      setState(() {
        _message = 'Vui lòng nhập đầy đủ tiêu đề và nội dung';
        _responseText = '';
      });
      return;
    }

    setState((){
      _isLoading = true;
      _message = '';
      _responseText = '';
    });

    try{
      final Post post =  await _postController.createPost(
        title: title,
        body: body,
        userId: 1,
      );


      setState(() {
        _message = 'Post created successfully';
        _responseText = jsonEncode({
          'id': post.id,
          'title': post.title,
          'body': post.body,
          'userId': post.userId,
        });
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Post created successfully'),
        )
      );

    }catch (e){
      setState(() {
        _message = 'Loi: $e';
        _responseText = '';
      });
    }finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Post - 6451071035'),),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 16,),

              TextField(
                controller: _bodyController,
                decoration: InputDecoration(
                  labelText: 'Body',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20,),

              _isLoading ? CircularProgressIndicator() :
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: _createPost,
                        child: Text('Create Post'),
                    ),
                  ),

              SizedBox(height: 20,),

              if (_message.isNotEmpty)
                Text(
                  _message,
                  style: TextStyle(
                    color: _message == 'Post created successfully'
                        ? Colors.green : Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

              const SizedBox(height: 16,),

              if (_responseText.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Text(
                    _responseText,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
            ],
          ),
        ),

      ),
    );
  }
}