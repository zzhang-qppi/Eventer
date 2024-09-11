import 'package:flutter/material.dart';

class OrganizationPage extends StatelessWidget {
  const OrganizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: OrgSearchBar(),
            ),
            SizedBox(height: 40),
            OrganizationCard(),
            SizedBox(height: 20),
            OrganizationCard(),
            SizedBox(height: 20),
            OrganizationCard(),
            SizedBox(height: 20),
            OrganizationCard(),
            SizedBox(height: 20),
            OrganizationCard(),
            SizedBox(height: 20),
            OrganizationCard(),
            SizedBox(height: 20),
            OrganizationCard(),
          ],
        ),
      ),
    );
  }
}

class OrgSearchBar extends StatefulWidget {
  const OrgSearchBar({super.key});

  @override
  State<OrgSearchBar> createState() => _OrgSearchBarState();
}

class _OrgSearchBarState extends State<OrgSearchBar> {
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
        final String item = 'Org $index';
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

class OrganizationCard extends StatelessWidget {
  const OrganizationCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth - 50,
      height: 100,
      color: Colors.grey,
    );
  }
}
