import 'package:flutter/material.dart';
import 'package:movieapp/feature/domain/movie/movies.dart';
import 'package:movieapp/feature/presentation/detail/detail_page.dart';
import 'package:movieapp/feature/presentation/widget/categories_card.dart';
import 'package:movieapp/feature/presentation/widget/detail_page_header.dart';
import 'package:movieapp/feature/presentation/widget/floating_bottom_nav.dart';
import 'package:movieapp/feature/presentation/widget/home_header.dart';
import 'package:movieapp/feature/presentation/widget/movie_poster.dart';
import 'package:movieapp/feature/presentation/widget/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(),
          SearchBar(),
          const SizedBox(height: 15),
          const Text(
            'Categories',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoriesCard(
                    text: "Horror",
                    color: Colors.deepPurpleAccent,
                  ),
                  CategoriesCard(
                    text: "Romance",
                  ),
                  CategoriesCard(
                    text: "Comedy",
                  ),
                  CategoriesCard(
                    text: "Action",
                  ),
                ]),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Popular',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
              Text(
                'See All',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    var mv = const Movie(
                        collectionId: 1600477838,
                        artistName: 'Jon Favreau',
                        trackName: 'Iron Man',
                        artworkUrl100:
                            "https://is5-ssl.mzstatic.com/image/thumb/Video118/v4/02/0e/c9/020ec98b-f4b3-05e9-2de3-5e7d0363b298/source/100x100bb.jpg",
                        shortDescription:
                            "After surviving an unexpected attack in enemy territory, jet-setting industrialist Tony Stark builds",
                        longDescription:
                            "After surviving an unexpected attack in enemy territory, jet-setting industrialist Tony Stark builds a high-tech suit of armor and vows to protect the world as Iron Man. Straight from the pages of the legendary comic book, Iron Man is a hero who is built - not born - to be unlike any other.");
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MovieDetailPage(movie: mv)));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const MoviePoster(
                      id: 1,
                      url:
                          'https://is5-ssl.mzstatic.com/image/thumb/Video118/v4/02/0e/c9/020ec98b-f4b3-05e9-2de3-5e7d0363b298/source/100x100bb.jpg',
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const FloatingBottomNav()
        ],
      ),
    );
  }
}
