import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quad_b/infrastructure/dal/daos/models/movieListModel.dart'
    hide Image;

import 'controllers/details.controller.dart';

class DetailsScreen extends GetView<DetailsController> {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final MovieListModel movieData = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(movieData.show.name),
        backgroundColor: Colors.red.withOpacity(0.2),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(9),
                        child: Image.network(
                          movieData.show.image.medium,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 80,
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
