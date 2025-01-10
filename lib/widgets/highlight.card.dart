import 'package:flutter/material.dart';

class HighlightSection extends StatefulWidget {
  @override
  _HighlightSectionState createState() => _HighlightSectionState();
}

class _HighlightSectionState extends State<HighlightSection> {
  int _currentPage = 1;

  final List<Widget> _highlightCards = [
    HighlightCard(
        title: 'Safe Scrum Master',
        location: 'West Des Moines, IA - 30 Oct - 31 Oct',
        price: '\$825',
        imageUrl: 'https://img.freepik.com/free-photo/abstract-dark-background-with-flowing-colouful-waves_1048-13124.jpg'),
    HighlightCard(
        title: 'Agile Practitioner',
        location: 'Chicago, IL - 12 Nov - 14 Nov',
        price: '\$799',
        imageUrl: 'https://img.freepik.com/free-photo/abstract-dark-background-with-flowing-colouful-waves_1048-13124.jpg'),
    HighlightCard(
        title: 'Lean Management',
        location: 'New York, NY - 20 Dec - 21 Dec',
        price: '\$899',
        imageUrl: 'https://img.freepik.com/free-photo/abstract-dark-background-with-flowing-colouful-waves_1048-13124.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Highlights',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Stack(
            children: [
              // PageView
              Container(
                height: 150,
                child: PageView.builder(
                    controller: PageController(
                      viewportFraction: 0.8,
                      initialPage: 1,
                    ),
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _highlightCards.length,
                  itemBuilder: (context, index) {
                    return _highlightCards[index];
                  },
                ),
              ),

            ],
          ),

          // Page Indicator
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _highlightCards.length,
                  (index) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: _currentPage == index ? 16 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HighlightCard extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final String imageUrl;

  HighlightCard({
    required this.title,
    required this.location,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  location,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Text(
                  price,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Text('View Details >', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
