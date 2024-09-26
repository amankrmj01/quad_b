import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final containerHeight = 300.0.obs;
  final double _minHeight = 100.0;
  final double _maxHeight = 300.0;
  double _lastOffset = 0.0;
  final isAtTop = true.obs;

  @override
  void onReady() {
    scrollController.addListener(_onScroll);
    super.onReady();
  }

  void _onScroll() {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels == 0) {
        // Scrolled to the top
        containerHeight.value = _maxHeight;
        isAtTop.value = true;
      }
    } else {
      if (scrollController.offset > _lastOffset) {
        // Scrolling down
        containerHeight.value = _minHeight;
        isAtTop.value = false;
      }
    }
    _lastOffset = scrollController.offset;
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
