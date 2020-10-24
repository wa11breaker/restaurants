import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/provider/navigation.dart';

import 'screens/discover/discover.dart';
import 'screens/home/home.dart';
import 'widgets/bottom_nav_icon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      Home(),
      Discover(),
    ];

    List<IconData> _icons = [Icons.home, Icons.map_outlined, Icons.person];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (context) => NavigationProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Consumer<NavigationProvider>(
            builder: (context, model, _) => _screens[model.index],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  color: Colors.black12,
                ),
              ],
            ),
            child: Consumer<NavigationProvider>(
              builder: (context, model, _) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(
                    _icons.length,
                    (index) => BottomNavIcon(
                      icon: _icons[index],
                      index: index,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
