import 'package:api_hanlding_with_bloc_dio/data/models/post_model.dart';
import 'package:api_hanlding_with_bloc_dio/logic/cubits/post_cubit.dart';
import 'package:api_hanlding_with_bloc_dio/logic/cubits/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
        title: const Text("API Handling"),
      ),
      body: SafeArea(
        child: BlocConsumer<PostCubit, PostState>(
          listener: (context, state) {  
            if(state is PostErrorState){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error.toString()),
                  backgroundColor: Colors.red,
                )
              );
            }
          },
          builder: (context, state) {
            
            if (state is PostLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
          }

          if(state is PostLoadedState){
            return buildPostListview(state.posts);
          }
          return const Center(
            child: Text("An error occurred"),
          );
          }
          )
        ),
    );
  }

 Widget buildPostListview(List<PostModel> posts){
  return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context,index){
        PostModel post = posts[index];
        return ListTile(
          title: Text("${index+1}. "+post.title.toString()),
          subtitle: Text(post.body.toString()),
        );
      }
    );
 }

}
