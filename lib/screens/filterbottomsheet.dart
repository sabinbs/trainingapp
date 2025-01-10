import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trainingapp/controller/home.controller.dart';

class SortAndFiltersBottomSheet extends StatefulWidget {
  const SortAndFiltersBottomSheet({Key? key}) : super(key: key);

  @override
  State<SortAndFiltersBottomSheet> createState() =>
      _SortAndFiltersBottomSheetState();
}

class _SortAndFiltersBottomSheetState
    extends State<SortAndFiltersBottomSheet> {

  final HomeScreenController homeScreenController =
  Get.put(HomeScreenController());

  String? selectedLocation = 'West Des Moines';
  String? selectedTrainingName;
  String? selectedTrainer;

  final List<String> locations = [
    'West Des Moines',
    'Chicago',
    'Phoenix',
    'Dallas',
    'San Diego',
    'San Francisco',
    'New York',
  ];

  final List<String> trainingNames = [
    'Safe Scrum Master (4.6)',
    'Agile Practitioner',
    'Lean Management',
  ];

  final List<String> trainers = [
    'Helen Gribble',
    'Dan David',
    'Pat George',
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 0.9,
      minChildSize: 0.5,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Filter",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        homeScreenController.trainingList.clear();
                        homeScreenController.fillInitialData();
                        Navigator.pop(context);
                      }
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                  /*  const SizedBox(height: 10),
                    // Sort by Section
                    const Text(
                      "Sort by",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),*/
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Location Section
                    const Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...locations.map(
                          (location) => CheckboxListTile(
                        value: selectedLocation == location,
                        title: Text(location),
                        onChanged: (bool? value) {
                          if (value != null && value) {
                            setState(() {
                              selectedLocation = location;
                              debugPrint(selectedLocation.toString());
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Training Name Section
                    const Text(
                      "Training Name",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...trainingNames.map(
                          (trainingName) => CheckboxListTile(
                        value: selectedTrainingName == trainingName,
                        title: Text(trainingName),
                        onChanged: (bool? value) {
                          if (value != null && value) {
                            setState(() {
                              selectedTrainingName = trainingName;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Trainer Section
                    const Text(
                      "Trainer",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...trainers.map(
                          (trainer) => CheckboxListTile(
                        value: selectedTrainer == trainer,
                        title: Text(trainer),
                        onChanged: (bool? value) {
                          if (value != null && value) {
                            setState(() {
                              selectedTrainer = trainer;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    homeScreenController.filterTrainingList(location: selectedLocation,trainerName: selectedTrainer,trainingName: selectedTrainingName);
                   /* homeScreenController.trainingList.value = homeScreenController.trainingList.where((o) => (o.location == selectedLocation||o.title == selectedTrainingName||o.speakerName == selectedTrainer)).toList();
                    homeScreenController.trainingList.refresh();*/
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150, 50),
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: Text("Apply",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        );
      },
    );
  }
}