import 'package:flutter/material.dart';
import 'package:restaurants/widgets/food_label.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/food_card.dart';
import 'widgets/restaurants_bio.dart';

class RestaurantDetails extends StatelessWidget {
  _launchMap() async {
    const url =
        'https://www.google.com/maps/place/Ramees+Restaurant/@8.888076,76.5889204,17z/data=!3m1!4b1!4m5!3m4!1s0x3b05fc59b77cef01:0x31d0461db4cebef!8m2!3d8.8880707!4d76.5911091';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<String> image = [
    'https://images.pexels.com/photos/6267/menu-restaurant-vintage-table.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      child: PageView.builder(
                        itemCount: image.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            image[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black26, Colors.transparent],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                    )
                  ],
                ),
              ),
              RestaurantsBio(),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () => _launchMap(),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.blueGrey[300],
                  child: Image.network(
                    'https://i.stack.imgur.com/dApg7.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Recommended',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      padding: const EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 24,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return FoodCard(
                          imageUrl: index % 3 == 0
                              ? 'https://c.ndtvimg.com/2019-05/usn4dnv_fried-chicken_625x300_24_May_19.jpg'
                              : "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&w=1000&q=80",
                          foodName: 'Chicken Fried Rice',
                          isVeg: index % 3 == 0 ? true : false,
                          price: 499,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
