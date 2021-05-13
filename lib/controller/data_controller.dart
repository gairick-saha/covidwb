import 'package:covidwb/core/screens/result_screen.dart';
import 'package:covidwb/helpers/Api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  bool isLoading = true;

  FocusNode searchFocus = FocusNode();

  String query = '';

  String selectedMenu = '';

  List<String> menuItems = [
    'OXYGEN',
    'DOCTORS',
    'VOLUNTEERS',
  ];

  List<dynamic> searchResult = [];

  @override
  void onInit() {
    super.onInit();
    selectedMenu = menuItems[0];
  }

  void readInput(field, value) {
    field = value;
    update();
  }

  void selectMenu(index) {
    selectedMenu = menuItems[index];
    update();
  }

  void search() {
    if (query.trim() == "") {
      Get.snackbar('Error', "Location can't be empty.",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.to(() => ResultScreen());
    }
  }

  void changeMenu(index) {
    selectedMenu = menuItems[index];

    getResult();
    update();
  }

  Future<void> getResult() async {
    String _searchOption;

    if (selectedMenu == 'OXYGEN') {
      _searchOption = "o2suppliers";
      isLoading = true;

      await Api.internal().get('$_searchOption?location=$query').then((value) {
        isLoading = false;
        searchResult = value;
        update();
      });
    }
    if (selectedMenu == 'DOCTORS') {
      isLoading = true;
    }
    if (selectedMenu == 'VOLUNTEERS') {
      isLoading = true;
    }

    // await Api.internal().get('$_searchOption?location=$query').then((value) {
    //   isLoading = false;
    //   searchResult = value;
    //   update();
    // });
  }
}
