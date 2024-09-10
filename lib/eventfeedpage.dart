import 'package:flutter/material.dart';

class EventFeedPage extends StatelessWidget {
  const EventFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
      return const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Happening Right Now"),
              ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Row(
              children: [
                EventHappeningNow(),
                SizedBox(width: 50,),
                EventHappeningNow(),
                SizedBox(width: 50,),
                EventHappeningNow(),
                ],
                ),
          )
          
          ],
      );
  }
}

class EventHappeningNow extends StatelessWidget {
  const EventHappeningNow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      color: Colors.grey,
    );
  }
}
