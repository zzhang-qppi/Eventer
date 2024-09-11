import 'package:flutter/material.dart';

class EventFeedPage extends StatelessWidget {
  const EventFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
      return Column(
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
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 260,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    EventHappeningNow(),
                    SizedBox(width: 30,),
                    EventHappeningNow(),
                    SizedBox(width: 30,),
                    EventHappeningNow(),
                    ],
                  ),
                ),
              ),
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
