import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:restaurants/screens/food_details/food_details.dart';
import 'package:restaurants/widgets/food_label.dart';

class FoodCard extends StatelessWidget {
  final String foodName;
  final int price;
  final String imageUrl;
  final bool isVeg;

  const FoodCard({
    Key key,
    this.foodName,
    this.price,
    this.imageUrl,
    this.isVeg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (_, openContainer) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: openContainer,
          child: GridTile(
            header: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FoodLabel(
                  isVeg: isVeg,
                ),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            footer: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Chicken Fried Rice',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text('₹$price'),
                  SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      closedElevation: 0,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      openBuilder: (_, closeContainer) => FoodDetails(),
    );
  }
}
