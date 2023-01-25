import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/animatedmovie.dart';

import 'package:movieapp/bloc/movie_export.dart';
import 'package:movieapp/bottomnavigation.dart';
import 'package:movieapp/color.dart';
import 'package:movieapp/movielist.dart';
import 'package:movieapp/nowplaying.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

int current = 1;
TextEditingController search = TextEditingController();

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(Homepageapi());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor.appcolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white60,
                          child: Icon(Icons.face, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              const TextSpan(
                                  text: 'Hello ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  )),
                              TextSpan(
                                  text: 'Arie',
                                  style: GoogleFonts.acme(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  )),
                            ])),
                            const Text(
                              'Book your favourite movies',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey.shade400,
                      backgroundImage:
                          const AssetImage('images/notification.png'),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: search,
                    onSubmitted: (value) {
                      context.read<MovieBloc>().add(Search(key: value));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Movielist(id: '3')));
                      search.clear();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search movie..',
                      suffixIcon: const Icon(Icons.menu),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Now Playing',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Movielist(id: '1')));
                        },
                        child: const Text(
                          'see all',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              const Nowplaying(),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: 'Animation ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Film',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ))
                    ])),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Movielist(id: '2')));
                        },
                        child: const Text(
                          'see all',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              const Animationfilms()
            ],
          ),
        ),
        bottomNavigationBar: const Bottomnavigation(),
      ),
    );
  }
}
