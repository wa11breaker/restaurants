import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantsBio extends StatelessWidget {
  const RestaurantsBio({
    Key key,
  }) : super(key: key);

  _launchWebsite() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchDialer() async {
    const url = 'tel:73530022887';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> foodType = [
      'South Indian',
      'Chainese',
      'Arabian',
    ];
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rameez',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 6,
          ),
          Wrap(
            spacing: 8,
            // runSpacing: 8,
            children: List.generate(
              foodType.length,
              (index) => Chip(
                backgroundColor: Colors.orange,
                label: Text(
                  foodType[index],
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            'Ground Floor, TV Plaza, Residency Rd, near LIC Building, Kollam, Kerala 691001',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.grey, height: 1.3),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Icon(Icons.phone, size: 18, color: Colors.grey),
              SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () => _launchDialer(),
                child: Text(
                  '9356220556',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.blue),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Icon(Icons.web, size: 18, color: Colors.grey),
              SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () => _launchWebsite(),
                child: Text(
                  'www.restorent.com',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.blue),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star_rate,
                        size: 18,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        r'4.1',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '10349 Ratings',
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.timer,
                        size: 18,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '47 MINS',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Delivery Time',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '₹300',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '₹300 for two',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
