import 'package:flutter/material.dart';

class StaffBottomNavigation extends StatelessWidget {
  const StaffBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staff"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("restorant"),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
