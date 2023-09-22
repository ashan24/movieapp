import 'package:flutter/material.dart';
import 'package:movieapp/bloc/movie_export.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  const DetailScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    String id = widget.id;
    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      final snapshot = state.details;
      //print(snapshot);
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Hero(
                  tag: id,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/$id',
                    fit: BoxFit.fill,
                  )),
            ),
            //Text(snapshot[0]['overview']),
          ],
        ),
      );
    });
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Detail'),
    //   ),
    //   body: SizedBox(
    //     height: 300,
    //     width: MediaQuery.of(context).size.width,
    //     child: Hero(
    //         tag: id,
    //         child: Image.network(
    //           'https://image.tmdb.org/t/p/w500/$id',
    //           fit: BoxFit.fill,
    //         )),
    //   ),
    // );
  }
}
