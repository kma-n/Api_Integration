import 'package:api_integration/bloc/post_bloc.dart';
import 'package:api_integration/model/posts_model.dart';
import 'package:api_integration/model/title_post_model.dart' as title_post;
import 'package:api_integration/persistance/api_provider.dart';
import 'package:flutter/material.dart';

class PostsList extends StatefulWidget {
  const PostsList({
    Key? key,
  }) : super(key: key);

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  title_post.Title? postTitle;

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                decoration:
                    const InputDecoration(labelText: "Enter New Post title"),
              ),
            ),
            TextButton(
                onPressed: () async {
                  final String _title = _controller.text;
                  postTitle = await ApiProvider().postPosts(_title);
                  setState(() {});
                  _controller.text = "";
                },
                child: const Text("Enter"))
          ],
        ),
        ListTile(
          title: Text(postTitle?.title ?? ""),
        ),
        Expanded(
          child: StreamBuilder(
            stream: PostBloc().posts,
            builder: (context, AsyncSnapshot<List<Posts>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.none) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text("Error");
                }
              }
              List<Posts>? posts = snapshot.data;
              return ListView.separated(
                itemCount: posts?.length ?? 0,
                separatorBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(posts?[index].title ?? ""),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
