import 'package:flutter/material.dart';
import 'package:movieapp/bloc/movie_export.dart';
import 'package:movieapp/bottomnavigation.dart';
import 'package:movieapp/color.dart';

class Movielist extends StatefulWidget {
  final String id;
  const Movielist({required this.id, Key? key}) : super(key: key);

  @override
  State<Movielist> createState() => _MovielistState();
}

class _MovielistState extends State<Movielist> {
  @override
  Widget build(BuildContext context) {
    try {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Appcolor.appcolor,
          body: BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
            final data = widget.id == '1'
                ? state.nowplaying
                : widget.id == '2'
                    ? state.animationfilm
                    : state.searchfilm;
            if (data.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.9 / 1.7,
                    ),
                    itemCount: data.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: data[index]['poster_path'] != null
                                ? Image.network(
                                    "https://image.tmdb.org/t/p/w500/${data[index]['poster_path']}"
                                    // width: MediaQuery.of(context).size.width * 0.4,
                                    )
                                : const SizedBox(
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        'No Image',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Flexible(
                              child: Text(
                            data[index]['title'],
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ))
                        ],
                      );
                    })),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
          bottomNavigationBar: const Bottomnavigation(),
        ),
      );
    } catch (e) {
      print(e);
    }
    return const SizedBox(
      height: 10,
    );
  }
}
