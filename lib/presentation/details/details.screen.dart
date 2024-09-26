import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quad_b/infrastructure/dal/daos/models/movieListModel.dart'
    hide Image;
import 'package:quad_b/presentation/utils/process_summary_text.dart';
import 'package:velocity_x/velocity_x.dart';
import 'controllers/details.controller.dart';

class DetailsScreen extends GetView<DetailsController> {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieListModel movieData = Get.arguments;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(15),
              topLeft: Radius.circular(10),
            ),
          ),
          elevation: 0,
          mini: true,
          backgroundColor: Colors.black.withOpacity(0.4),
          onPressed: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        body: SafeArea(
          child: Stack(
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.8),
                      Colors.black,
                    ],
                    stops: const [0.0, 0.3, 0.75, 1.0],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.darken,
                child: Image.network(
                  movieData.show.image.original,
                  fit: BoxFit.cover,
                  height: Get.height,
                ),
              ),
              Column(
                children: [
                  20.heightBox,
                  Obx(
                    () => AnimatedContainer(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      alignment: controller.isAtTop.value
                          ? Alignment.topCenter
                          : Alignment.topLeft,
                      width: controller.isAtTop.value
                          ? Get.width * 0.45
                          : Get.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(0.8),
                      ),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                      height: controller.containerHeight.value,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 800),
                            height: controller.isAtTop.value
                                ? controller.containerHeight.value * 0.7
                                : controller.containerHeight.value * 0.75,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  controller.containerHeight.value == 300
                                      ? 16
                                      : 8),
                              child: Image.network(
                                movieData.show.image.medium,
                                fit: BoxFit.cover,
                                cacheHeight: Get.height.toInt(),
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return SizedBox(
                                        height:
                                            controller.containerHeight.value *
                                                0.75,
                                        child:
                                            const CircularProgressIndicator());
                                  }
                                },
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            padding: const EdgeInsets.all(10),
                            duration: const Duration(milliseconds: 200),
                            child: Column(
                              crossAxisAlignment: controller.isAtTop.value
                                  ? CrossAxisAlignment.center
                                  : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movieData.show.name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                                Text(
                                  movieData.show.genres.join(', '),
                                  style: const TextStyle(color: Colors.white70),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                !controller.isAtTop.value
                                    ? Text(
                                        movieData.show.premiered.year
                                            .toString(),
                                        style: TextStyle(color: Colors.white70),
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    : const SizedBox(
                                        height: 0,
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: controller.scrollController,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          RichText(
                            text: processSummary(
                                movieData.show.summary, Colors.white, 24),
                          ),
                          400.heightBox
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
