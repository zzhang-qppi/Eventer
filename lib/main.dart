import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventer Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(44, 62, 76, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;
  void _onBottomItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
    });
  }
  void _onMakeButtonPressed() {
    print("make button pressed");
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    var makeButtonText = "Make";
    switch (_selectedIndex) {
      case 0:
        page = EventFeedPage();
        makeButtonText = "Make Event";
        break;
      case 1:
        page = Placeholder();
        makeButtonText = "Make Org";
        break;
      case 2:
        page = Placeholder();
        makeButtonText = "Make Org";
        break;
      case 3:
        page = Placeholder();
        makeButtonText = "Make Org";
        break;
      default:
        throw UnimplementedError('no widget for $_selectedIndex');
    }

    final theme = Theme.of(context);

    final appBarTitleStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontFamily: 'LemonShakeShake',
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          titleSpacing: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage('https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp'),
                  ),
                ),
                const SizedBox(width: 30.0),
                Text("Eventer", style: appBarTitleStyle,),
              ],
            ),
          ),
          backgroundColor: theme.colorScheme.primary,
          toolbarHeight: 80,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PreferredSize(
                preferredSize: const Size.fromWidth(60.0),
                child:
                  (_selectedIndex == 0 || _selectedIndex == 1) ?
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add_circle),
                    onPressed: _onMakeButtonPressed, 
                    label: Text(makeButtonText))
                  : Container(),
              )
            ),
          ],
        ),
      ),
      body: Expanded(
        child: Container(
          color: theme.colorScheme.secondaryContainer,
          child: page
        )
      ),
      bottomNavigationBar: Material(
        elevation: 20,
        child: Container(
          height: 100,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.emoji_objects),
                label: 'Events',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Organizations',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: theme.colorScheme.primary,
            onTap: _onBottomItemTapped,
          ),
        ),
      ),
    );
  }
}

class EventFeedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return Container();
  }
}