import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quad_b/presentation/mainboard/controllers/mainboard.controller.dart';
import 'package:quad_b/presentation/utils/consts/image/image.dart';
import '../../infrastructure/dal/daos/models/movieListModel.dart' hide Image;
import '../utils/movie_tile.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    MainboardController mainboardController = Get.find();
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(appLogo, height: 50),
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          mainboardController.currentIndex.value = 1;
                        },
                        child: Container(
                          height: 48,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(color: Colors.transparent),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey),
                              SizedBox(width: 10),
                              Text(
                                'Search...',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              Expanded(
                child: StreamBuilder<List<MovieListModel>>(
                  stream: controller.dataStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No data available'));
                    } else {
                      return MovieTileGenerator(snapshot: snapshot);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
