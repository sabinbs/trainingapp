import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeScreenController extends GetxController {
  RxList<Training> trainingList=<Training>[].obs;
  RxBool isFilter = false.obs;

  List <Training> items = [
    Training(
      'Oct 11 - 13, 2019',
      '08:30am-12:30pm',
      'West Des Moines',
      'Filling Fast!',
      Colors.red,
      'Safe Scrum Master (4.6)',
      'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg',
      'Helen Gribble',
      'Keynote Speaker',
    ),
    Training(
      'Oct 14 - 16, 2019',
      '02:30am-6:30 pm',
      'Chicago',
      'Early Bird!',
      Colors.orange,
      'Agile Practitioner',
      'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
      'Dan David',
      'Keynote Speaker',
    ),
    Training(
      'Oct 21 - 23, 2019',
      '10:30am-2:30 pm',
      'New York',
      'Early Bird!',
      Colors.orange,
      'Lean Management',
      'https://img.freepik.com/free-psd/portrait-man-teenager-isolated_23-2151745771.jpg',
      'Pat George',
      'Keynote Speaker',
    )];

  fillInitialData() {
    trainingList.addAll(items);
  }

  void filterTrainingList({
    String? location,
    String? trainerName,
    String? trainingName,
  }) {
    // Use the `where` method to filter based on the provided criteria
    var filteredList = items.where((training) {
      final locationMatches = location == null || training.location.contains(location);
      final trainerMatches = trainerName == null || training.speakerName.contains(trainerName);
      final trainingNameMatches = trainingName == null || training.title.contains(trainingName);

      return locationMatches && trainerMatches && trainingNameMatches;
    }).toList();

    // Update the observable list with the filtered results
    trainingList.value = filteredList;
    trainingList.refresh();
  }
}

class Training {
  String dateRange;
  String time;
  String location;
  String status;
  Color statusColor;
  String title;
  String speakerImageUrl;
  String speakerName;
  String speakerTitle;

  Training(
      this.dateRange,
      this.time,
      this.location,
      this.status,
      this.statusColor,
      this.title,
      this.speakerImageUrl,
      this.speakerName,
      this.speakerTitle);
}
