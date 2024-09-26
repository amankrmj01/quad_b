import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../infrastructure/dal/daos/models/movieListModel.dart';
import '../../../infrastructure/dal/services/netwrok/injection.dart';

class SearchhController extends GetxController {
  TextEditingController searchController = TextEditingController(text: 'all');
  final _dataStreamController = StreamController<List<MovieListModel>>();
  Stream<List<MovieListModel>> get dataStream => _dataStreamController.stream;

  final focusNode = FocusNode();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchData();
  }

  @override
  void onClose() {
    searchController.dispose();
    focusNode.dispose();
    _dataStreamController.close();
    super.onClose();
  }

  void fetchData() async {
    try {
      final data =
          await restClient.movieListModel({'q': searchController.text});
      _dataStreamController.add(data);
    } catch (e) {
      _dataStreamController.addError(e);
    }
  }
}
