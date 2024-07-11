import 'package:api_hanlding_with_bloc_dio/data/models/post_model.dart';
import 'package:api_hanlding_with_bloc_dio/data/repositories/post_repositories.dart';
import 'package:api_hanlding_with_bloc_dio/logic/cubits/post_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState>{
  PostCubit() : super(PostLoadingState()){
    fetchPosts();
  }


  PostRepository postRepository = PostRepository();

  void fetchPosts() async {
    try{
      List<PostModel> posts = await postRepository.fetchPost();
      emit(PostLoadedState(posts));
    }on DioError catch(ex){
      if(ex.type == DioErrorType.connectionError){
        emit(PostErrorState("Can't fetch posts, please check your internet connection!"));
      }else{
        emit(PostErrorState(ex.toString()));
      }
    }
  }
  
}