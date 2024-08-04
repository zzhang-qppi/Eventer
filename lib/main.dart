import 'package:flutter/material.dart';
import 'package:eventer_main/eventfeedpage.dart' show EventFeedPage;
import 'package:eventer_main/loginpage.dart' show LoginPage;

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
  var _loggedin = false;

  void onBottomItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
    });
  }

  void onProfilePhotoTapped() {
    setState(() {
      _selectedIndex = 4;
    });
  }

  void onMakeButtonPressed() {
    print("make button pressed");
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedIndex == 4) {
      return LoginPage(onBackArrowPressed: ()=>onBottomItemTapped(1),);
    }
    return MyHomePageScaffold(
      selectedIndex: _selectedIndex, 
      onBottomItemTapped: onBottomItemTapped, 
      onProfilePhotoTapped: onProfilePhotoTapped, 
      onMakeButtonPressed: onMakeButtonPressed,
      );
  }
}

class MyHomePageScaffold extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onBottomItemTapped;
  final VoidCallback onProfilePhotoTapped;
  final VoidCallback onMakeButtonPressed;

  const MyHomePageScaffold({
    super.key,
    required this.selectedIndex,
    required this.onBottomItemTapped,
    required this.onProfilePhotoTapped,
    required this.onMakeButtonPressed,
  });


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final appBarTitleStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontFamily: 'LemonShakeShake',
    );

    Widget buildBottomNavBar() {
      if (selectedIndex == 4) {
        return Container();
      }
      return Material(
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
            currentIndex: selectedIndex,
            selectedItemColor: theme.colorScheme.primary,
            onTap: onBottomItemTapped,
          ),
        ),
      );
    }

    Widget page;
    var makeButtonText = "Make";
    switch (selectedIndex) {
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
        throw UnimplementedError('no widget for $selectedIndex');
    }

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
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: InkWell(
                    onTap: onProfilePhotoTapped,
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage('https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp'),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Text("Eventer", style: appBarTitleStyle,),
              ],
            ),
          ),
          backgroundColor: theme.colorScheme.primary,
          toolbarHeight: 80,
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 7.0),
              child:
                  (selectedIndex == 0 || selectedIndex == 1) ?
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add_circle),
                    onPressed: onMakeButtonPressed, 
                    label: Text(makeButtonText))
                  : Container(),
              )
          ],
        ),
      ),
      body: Expanded(
        child: Container(
          color: theme.colorScheme.secondaryContainer,
          child: page
        )
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }
}

