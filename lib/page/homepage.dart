import 'package:bsruhorpak/page/profile.dart';
import 'package:bsruhorpak/page/settings.dart';

import 'package:flutter/material.dart';
import 'chat.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Home(),
    Chat(),
    Profile(),
    Settings(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      // floatingActionButton: FlatButton(

      //   child: (Image.asset('assets/logohorpak.png',height: 50,)),
      //   onPressed: () {},
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.purple,
                    minWidth: 100,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Home(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.white : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    color: Colors.purple,
                    minWidth: 100,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Chat(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.book_online,
                          color: currentTab == 1 ? Colors.white : Colors.grey,
                        ),
                        Text(
                          'Booking',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.purple,
                    minWidth: 100,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Profile(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add_alert,
                          color: currentTab == 2 ? Colors.white : Colors.grey,
                        ),
                        Text(
                          'Alert',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 100,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Settings(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: currentTab == 3 ? Colors.white : Colors.grey,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
