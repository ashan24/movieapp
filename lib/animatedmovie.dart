import 'package:flutter/material.dart';

import 'package:movieapp/bloc/movie_export.dart';
import 'package:movieapp/details.dart';

class Animationfilms extends StatefulWidget {
  const Animationfilms({Key? key}) : super(key: key);

  @override
  State<Animationfilms> createState() => _AnimationfilmsState();
}

int current = 0;

class _AnimationfilmsState extends State<Animationfilms> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      final snapshot = state.animationfilm;
      if (snapshot.isNotEmpty) {
        return SizedBox(
          height: 250,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                String key = snapshot[index]['id'].toString();
                return GestureDetector(
                  onTap: () {
                    context.read<MovieBloc>().add(Details(key: key));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => DetailScreen(
                                id: snapshot[index]['poster_path']))));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Hero(
                      tag: snapshot[index]['poster_path'],
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500/${snapshot[index]['poster_path']}",
                        height: 230,
                        width: 180,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                );
              }),
        );
      } else {
        return const SizedBox(
          height: 200,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
