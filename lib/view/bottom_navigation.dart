import 'package:flutter/material.dart';
import 'package:restorant_booking/view/destinations.dart';
import 'package:restorant_booking/view/home_screen.dart';

class StaffBottomNavigation extends StatelessWidget {
  StaffBottomNavigation({super.key});
  final List<Widget> screens = [const MyHomePage(), const Destinations()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[0],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on,
              ),
              label: "Destination")
        ],
        currentIndex: 0,
      ),
    );
  }
}
