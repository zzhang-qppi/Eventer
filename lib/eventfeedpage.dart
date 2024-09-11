import 'package:flutter/material.dart';

class EventFeedPage extends StatelessWidget {
  const EventFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: EventSearchBar(),
          ),
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
            padding: const EdgeInsets.all(25.0),
            child: SizedBox(
              height: 260,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  EventHappeningNow(),
                  SizedBox(
                    width: 10,
                  ),
                  EventHappeningNow(),
                  SizedBox(
                    width: 10,
                  ),
                  EventHappeningNow(),
                  SizedBox(
                    width: 10,
                  ),
                  EventHappeningNow(),
                  SizedBox(
                    width: 10,
                  ),
                  EventHappeningNow(),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10.0), child: Text("Up Next")),
          EventUpNext(),
          SizedBox(height: 30),
          EventUpNext(),
          SizedBox(
            height: 30,
          ),
          EventUpNext(),
          SizedBox(
            height: 30,
          ),
          EventUpNext(),
          SizedBox(
            height: 30,
          ),
          EventUpNext(),
        ],
      ),
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

class EventUpNext extends StatelessWidget {
  const EventUpNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth - 50.0,
      height: 130,
      color: Colors.grey,
    );
  }
}

class EventSearchBar extends StatefulWidget {
  const EventSearchBar({super.key});

  @override
  State<EventSearchBar> createState() => _EventSearchBarState();
}

class _EventSearchBarState extends State<EventSearchBar> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);
    double screenWidth = MediaQuery.of(context).size.width;

    return SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
      return SearchBar(
        constraints: BoxConstraints(
          maxWidth: screenWidth - 50.0,
          maxHeight: 50.0,
          minHeight: 30,
        ),
        controller: controller,
        padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0)),
        onTap: () {
          controller.openView();
        },
        onChanged: (_) {
          controller.openView();
        },
        leading: const Icon(Icons.search),
      );
    }, suggestionsBuilder: (BuildContext context, SearchController controller) {
      return List<ListTile>.generate(5, (int index) {
        final String item = 'Event $index';
        return ListTile(
          title: Text(item),
          onTap: () {
            setState(() {
              controller.closeView(item);
            });
          },
        );
      });
    });
  }
}
