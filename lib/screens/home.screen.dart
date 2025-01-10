import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trainingapp/controller/home.controller.dart';
import 'package:trainingapp/screens/detail.screen.dart';
import 'package:trainingapp/screens/filterbottomsheet.dart';

import '../widgets/highlight.card.dart';
import '../widgets/training.card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final HomeScreenController homeScreenController =
  Get.put(HomeScreenController());

  @override
  void initState() {
    homeScreenController.fillInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Trainings',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        actions: [
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Highlights Section
            HighlightSection(),

            // Filter Section
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const SortAndFiltersBottomSheet(),
                  );
                },
                icon: Icon(Icons.filter_list),
                label: Text('Filter'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  side: BorderSide(color: Colors.grey),
                ),
              ),
            ),

            // Training Cards Section
           Obx(()=> homeScreenController.trainingList.isEmpty?SizedBox(
               height: 240,
               child: const Center(
                 child: Text("No data Found")
               )):Padding(
               padding: const EdgeInsets.all(16.0),
               child: ListView.builder(
                 itemCount: homeScreenController.trainingList.length,
                 shrinkWrap: true,
                 physics: NeverScrollableScrollPhysics(),
                 itemBuilder: (context, index) {
                   return InkWell(
                     onTap: (){
                       Get.to(()=>DetailScreen(training: homeScreenController.trainingList[index]));
                     },
                     child: TrainingCard(
                       dateRange: homeScreenController.trainingList[index].dateRange,
                       time: homeScreenController.trainingList[index].time,
                       location: homeScreenController.trainingList[index].location,
                       status:  homeScreenController.trainingList[index].status,
                       statusColor:  homeScreenController.trainingList[index].statusColor,
                       title:  homeScreenController.trainingList[index].title,
                       speakerImageUrl:  homeScreenController.trainingList[index].speakerImageUrl,
                       // Replace with actual URL
                       speakerName:  homeScreenController.trainingList[index].speakerName,
                       speakerTitle:  homeScreenController.trainingList[index].speakerTitle,
                       onEnroll: () {
                         // Add enrollment functionality here
                       },
                     ),
                   );
                 },
               ))),
          ],
        ),
      ),
    );
  }


}
