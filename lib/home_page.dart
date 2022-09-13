import 'package:flutter/material.dart';
import 'package:flutter_api/services/api_service.dart';

import 'model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Posts>? posts;
  var isLoaded = false;

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  getPosts() async{
    posts = await ApiServices().fetchPosts();
    if(posts != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Data"),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts!.length,
          itemBuilder: (context, index){
            return Container(
              child: Text(posts![index].title),
            );
          },
        ),
        replacement: Container(child: CircularProgressIndicator()),
      ),
    );
  }
}
