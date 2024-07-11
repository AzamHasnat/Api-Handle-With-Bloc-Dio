import 'package:api_hanlding_with_bloc_dio/data/models/post_model.dart';

abstract class PostState{}

class PostLoadingState extends PostState{}

class PostLoadedState extends PostState{
  final List<PostModel> posts;
  PostLoadedState(this.posts);
}

class PostErrorState extends PostState{
  final String error;
  PostErrorState(this.error);
}




