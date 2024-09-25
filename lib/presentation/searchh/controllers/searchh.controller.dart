import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchhController extends GetxController {
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
