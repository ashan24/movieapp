import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/bloc/movie_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Nowplaying extends StatefulWidget {
  const Nowplaying({Key? key}) : super(key: key);

  @override
  State<Nowplaying> createState() => _NowplayingState();
}

int current = 0;

class _NowplayingState extends State<Nowplaying> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        final snapshot = state.nowplaying;
        if (snapshot.isNotEmpty) {
          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              CarouselSlider(
                items: [1, 2, 3, 4].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500/${snapshot[i]['poster_path']}",
                              // height: 200,
                              // width: 100,
                              fit: BoxFit.fill,
                            ),
                          ));
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 250.0,
                  autoPlay: true,
                  viewportFraction: 0.6,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      current = index;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedSmoothIndicator(
                activeIndex: current,
                count: 4,
                effect: const ExpandingDotsEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.white),
              )
            ],
          );
        } else {
          return const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
