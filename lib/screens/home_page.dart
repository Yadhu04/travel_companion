import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_companion/provider/profile_provider.dart';
import 'package:travel_companion/screens/profile_page.dart';
import 'package:travel_companion/screens/tool_page.dart';
import 'package:travel_companion/screens/trip_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> body = [const TripPage(), const ToolPage(), const ProfilePage()];
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false).getProfilePic();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          color: Colors.blue,
          backgroundColor: Colors.white,
          height: 47,
          items: const [
            Icon(Icons.shop),
            Icon(Icons.pan_tool),
            Icon(Icons.person)
          ]),
      body: Center(child: body[_currentIndex]),
    );
  }
}
