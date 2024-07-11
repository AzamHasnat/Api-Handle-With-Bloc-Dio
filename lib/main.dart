import 'package:api_hanlding_with_bloc_dio/data/models/post_model.dart';
import 'package:api_hanlding_with_bloc_dio/data/repositories/post_repositories.dart';
import 'package:api_hanlding_with_bloc_dio/logic/cubits/post_cubit.dart';
import 'package:api_hanlding_with_bloc_dio/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
          theme: ThemeData(
          useMaterial3: true,
          //primarySwatch: Colors.blue,
          colorSchemeSeed: const Color(0xff5a73d8),
        ),
         home: HomeScreen(),
      
        
      ),
    );
  }
}