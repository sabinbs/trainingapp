import 'package:flutter/material.dart';

class TrainingCard extends StatelessWidget {
  final String dateRange;
  final String time;
  final String location;
  final String status;
  final Color statusColor;
  final String title;
  final String speakerImageUrl;
  final String speakerName;
  final String speakerTitle;
  final VoidCallback onEnroll;

  TrainingCard({
    required this.dateRange,
    required this.time,
    required this.location,
    required this.status,
    required this.statusColor,
    required this.title,
    required this.speakerImageUrl,
    required this.speakerName,
    required this.speakerTitle,
    required this.onEnroll,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Date and Location Section
                SizedBox(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dateRange,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        time,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      Text(
                        location,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),

                // Vertical Divider
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 120,
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                ),

                // Event Details Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      status,
                      style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(speakerImageUrl),
                          radius: 16,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              speakerName,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(
                              speakerTitle,
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),


                          ],
                        ),


                      ],
                    ),
                    SizedBox(height: 40),


                  ],
                ),



              ],
            ),
          ),
          // Enroll Button
          Positioned(
            bottom: 5,
            right: 16,
            child:  ElevatedButton(
              onPressed: onEnroll,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Text("Enroll",style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      )


    );
  }
}

