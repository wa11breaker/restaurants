import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:restaurants/screens/restaurant_details/restaurant_details.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: OpenContainer(
        closedBuilder: (_, openContainer) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: openContainer,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    height: 120,
                    width: 100,
                    color: Colors.blueGrey[300],
                    child: Image.network(
                      'https://media-cdn.tripadvisor.com/media/photo-s/0c/56/4c/1a/ramees-restaurant.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rameez',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Arabian, South Indian, Chainese',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Kollam City | 5kms',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star_rate,
                          size: 18,
                          color: Colors.grey[600],
                        ),
                        Text(
                          r'4.1 . ₹300 for two',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
        closedElevation: 0,
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        // openColor: Colors.blue,
        // closedColor: Colors.blue,
        openBuilder: (_, closeContainer) {
          return RestaurantDetails();
        },
      ),
    );
  }
}
