import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quad_b/presentation/utils/consts/colors.dart';
import 'package:quad_b/presentation/utils/process_summary_text.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../infrastructure/dal/daos/models/movieListModel.dart' hide Image;

class MovieTileGenerator extends StatelessWidget {
  final AsyncSnapshot<List<MovieListModel>> snapshot;
  const MovieTileGenerator({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        final movie = snapshot.data![index];
        return MovieTile(movie: movie, width: width);
      },
      // separatorBuilder: (context, index) => Divider(
      //   color: Colors.grey,
      // ),
    );
  }
}

class MovieTile extends StatelessWidget {
  const MovieTile({
    super.key,
    required this.movie,
    required this.width,
  });

  final MovieListModel movie;
  final double width;

  @override
  Widget build(BuildContext context) {
    final show = movie.show;
    return Container(
      height: 150,

      margin: const EdgeInsets.symmetric(vertical: 4),
      // padding: const EdgeInsets.all(0.1),
      decoration: BoxDecoration(
        color: Color.lerp(Colors.black, Colors.red, 0.01),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(
            '/details',
            arguments: movie,
          );
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 150,
                width: width * 0.3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18.5),
                    bottomLeft: Radius.circular(18.5),
                  ),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        end: Alignment.centerRight,
                        begin: Alignment.centerLeft,
                        colors: [
                          // Colors.transparent,
                          Colors.transparent,
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.8),
                          Colors.black,
                        ],
                        stops: const [0.0, 0.2, 0.4, 0.8, 1.0],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.xor,
                    child: Image.network(
                      show.image.medium,
                      fit: BoxFit.cover,
                      scale: 1.6,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.white,
                          child: const Icon(
                            Icons.error,
                            size: 60,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(8),
                width: width * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LayoutBuilder(builder: (context, constraints) {
                      return Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 0.8,
                            child: Text(
                              show.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.lerp(color2, Colors.black, 0.2),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                show.rating.average.toString(),
                              ),
                              VxRating(
                                onRatingUpdate: (e) {},
                                value: show.rating.average,
                                count: 1,
                                isSelectable: false,
                                normalColor: Colors.grey,
                                selectionColor:
                                    Color.lerp(Colors.yellow, Colors.red, 0.3)!,
                              )
                            ],
                          )
                        ],
                      );
                    }),
                    Row(
                      children: [
                        Text(
                          '${show.language},',
                        ),
                        4.widthBox,
                        Text(
                          show.premiered.year.toString(),
                        ),
                      ],
                    ),
                    Text(
                      (show.genres.isNotEmpty) ? show.genres.join(', ') : 'NA',
                      overflow: TextOverflow.ellipsis,
                    ),
                    LayoutBuilder(builder: (context, constraints) {
                      return Container(
                        constraints: BoxConstraints(
                          maxHeight: constraints.maxHeight * 0.5,
                        ),
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          softWrap: true,
                          text: processSummary(show.summary,
                              Color.lerp(color2, Colors.white, 0.5)!, 16),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
