import 'dart:math';

import 'package:api_hanlding_with_bloc_dio/data/models/post_model.dart';
import 'package:api_hanlding_with_bloc_dio/data/repositories/api/api.dart';
import 'package:dio/dio.dart';

class PostRepository{

  API api = API();

   fetchPost() async {
    try{
      print("object");
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => PostModel.fromJson(postMap));
      //log(response.data.toString()); sasds
    }catch(ex){
      throw ex;
    }
  }
}
