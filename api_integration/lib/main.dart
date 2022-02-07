import 'package:api_integration/bloc/post_bloc.dart';
import 'package:api_integration/model/posts_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Check(),
    );
  }
}

class Check extends StatelessWidget {
  const Check({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: PostBloc().posts,
          builder: (context, AsyncSnapshot<List<Posts>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error");
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
                return Divider();
              },
            );
          },
        ),
      ),
    );
  }
}
