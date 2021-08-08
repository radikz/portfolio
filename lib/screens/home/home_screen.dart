import 'package:flutter/material.dart';
import 'package:portofolio/widgets/content.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final padding = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 234, 246, 0.8),
      body: Row(
        children: <Widget>[
          NavigationRail(
            minWidth: 56.0,
            groupAlignment: 1.0,
            backgroundColor: Color.fromRGBO(232, 234, 246, 1),
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            leading: Column(
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage('https://i.ibb.co/k4gzcrc/me.png'),
                  )
                ),
                SizedBox(
                  height: 108,
                ),
              ],
            ),
            selectedLabelTextStyle: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 15,
              letterSpacing: 0.8,
              decoration: TextDecoration.underline,
              decorationThickness: 2.0,
              fontWeight: FontWeight.w500
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 15,
              letterSpacing: 0.8,
                fontWeight: FontWeight.w500
            ),
            selectedIconTheme: IconThemeData(
              color: Colors.deepOrange,

            ),
            destinations: [
              buildRotatedTextRailDestination(Icons.home_outlined, "Home", padding),
              buildRotatedTextRailDestination(Icons.folder_open, "Project", padding),
            ],
          ),
          // This is the main content.
          Content(_selectedIndex)
        ],
      ),
    );
  }
}

NavigationRailDestination buildRotatedTextRailDestination(
    IconData icon, String text, double padding) {
  return NavigationRailDestination(
    label: Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(text),
      ),
    ),
    icon: RotatedBox(
      quarterTurns: -1,
      child: Icon(icon),
    ),

  );
}

