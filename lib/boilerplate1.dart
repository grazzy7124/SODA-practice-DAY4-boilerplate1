import 'package:flutter/material.dart';

void main() => runApp(const Boilerplate1());

class Boilerplate1 extends StatefulWidget {
  const Boilerplate1({super.key});

  static const TextStyle titleStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  @override
  State<Boilerplate1> createState() => _Boilerplate1State();
}

class _Boilerplate1State extends State<Boilerplate1> {

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    const String appTitle = 'SODA';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }, 
                icon: Icon(Icons.menu, color: Colors.white,),
                );
            }
          ),
          backgroundColor: Color(0xff4B6EB1),
          title: const Text(appTitle, style: Boilerplate1.titleStyle,)
          ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Color(0xff182949)),
                child: Text(
                  appTitle, 
                  style: Boilerplate1.titleStyle,
                  )
              ),
              ListTile(
                leading: Icon(Icons.favorite, color: Color(0xff7B7A7A)),
                title: Text('Icon: favorite', style: TextStyle(color: Color(0xff7B7A7A)),),
              )
            ],

          ),
        ),
        body: const Center(
          child: Text('Copyright 2022 SODA All rights reserved.',),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.error), label: 'Information'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),            
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Color(0xff4B6EB1),
          unselectedItemColor: Color(0xff979797),
          unselectedLabelStyle: TextStyle(color: Color(0xff979797)),
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}