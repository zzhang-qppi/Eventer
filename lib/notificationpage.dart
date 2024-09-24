import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 40),
            NotificationCard(),
            SizedBox(height: 20),
            NotificationCard(),
            SizedBox(height: 20),
            NotificationCard(),
            SizedBox(height: 20),
            NotificationCard(),
            SizedBox(height: 20),
            NotificationCard(),
            SizedBox(height: 20),
            NotificationCard(),
            SizedBox(height: 20),
            NotificationCard(),
          ],
        ),
      );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 380,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/carletonlogo.png"),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Opening Convocation"),
          )
        ],
      ),
    );
  }
}
