import 'package:flutter/material.dart';
import 'package:learn_basic_flutter/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class LandingCardImage extends StatefulWidget {
  const LandingCardImage({super.key});

  @override
  State<LandingCardImage> createState() => _LandingCardImageState();
}

class _LandingCardImageState extends State<LandingCardImage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieProvider>(context, listen: false).fetchMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    if (movieProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (movieProvider.errorMessage != null) {
      return Center(child: Text(movieProvider.errorMessage!));
    }

    final movies = movieProvider.movies;

    return Container(
        width: double.infinity,
        height: 150,
        margin: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            final imgPath = movie.imgPath;
            return SizedBox(
              width: 100,
              height: 150,
              child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: _buildImageCard(imgPath),
                  )),
            );
          },
        ));
  }
}

@override
Widget _buildImageCard(String url) {
  return Image.network(
    'http://192.168.69.89:8000/$url',
    fit: BoxFit.cover,
  );
}
