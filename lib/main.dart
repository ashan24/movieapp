import 'package:flutter/material.dart';
import 'package:movieapp/color.dart';
import 'package:movieapp/bloc/movie_export.dart';
import 'package:movieapp/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Appcolor.appcolor,
        ),
        title: 'Flutter Demo',
        home: const Homepage(),
      ),
    );
  }
}
