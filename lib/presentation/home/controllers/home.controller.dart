import 'dart:async';
import 'package:get/get.dart';
import 'package:quad_b/infrastructure/dal/services/netwrok/injection.dart';

import '../../../infrastructure/dal/daos/models/movieListModel.dart';

class HomeController extends GetxController {
  final _dataStreamController = StreamController<List<MovieListModel>>();

  Stream<List<MovieListModel>> get dataStream => _dataStreamController.stream;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _dataStreamController.close();
    super.onClose();
  }

  void fetchData() async {
    try {
      final data = await restClient.movieListModel({'q': 'all'});
      _dataStreamController.add(data);
    } catch (e) {
      _dataStreamController.addError(e);
    }
  }
}
