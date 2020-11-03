import 'package:get/get.dart';

class BottomBarController extends GetxController {
  final _currentIndex = 0.obs;

  get currentIndex => this._currentIndex.value;

  set currentIndex(index) => this._currentIndex.value = index;
}

