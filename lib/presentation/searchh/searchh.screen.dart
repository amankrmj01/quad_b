// searchh.screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:quad_b/presentation/mainboard/controllers/mainboard.controller.dart';
import 'package:quad_b/presentation/utils/movie_tile.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../infrastructure/dal/daos/models/movieListModel.dart';
import 'controllers/searchh.controller.dart';

class SearchhScreen extends GetView<SearchhController> {
  const SearchhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainboardController mainboardController = Get.find();
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection !=
          ScrollDirection.idle) {
        controller.focusNode.unfocus();
      }
    });

    ever(mainboardController.currentIndex, (index) {
      if (index == 1) {
        controller.focusNode.requestFocus();
      }
    });
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            8.heightBox,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    onTapOutside: (focusNode) {
                      controller.focusNode.unfocus();
                    },
                    controller: controller.searchController,
                    focusNode: controller.focusNode,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search',
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          controller.searchController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      const CircleBorder(),
                    ),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.all(8),
                    ),
                  ),
                  onPressed: () {
                    controller.fetchData();
                  },
                  child: const Icon(
                    Icons.search,
                    size: 40,
                  ),
                ),
              ],
            ),
            // Add a StreamBuilder to display the search results
            Expanded(
              child: StreamBuilder<List<MovieListModel>>(
                stream: controller.dataStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return MovieTileGenerator(snapshot: snapshot);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
