import 'package:flutter/material.dart';

void main() => runApp(const Boilerplate2());

class Boilerplate2 extends StatefulWidget {
  const Boilerplate2({super.key});

  static const TextStyle titleStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle ListTileTitleStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );

  static const TextStyle ListTileSubtitleStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color(0xff979797),
  );

  @override
  State<Boilerplate2> createState() => _Boilerplate1State();
}

class _Boilerplate1State extends State<Boilerplate2> {

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
          actions: [
            IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.notifications), color: Colors.white,
            ),
            IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.share), color: Colors.white,
            ),
            IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.search), color: Colors.white,
            ),            
          ],
          backgroundColor: Color(0xff182949),
          title: const Text(appTitle, style: Boilerplate2.titleStyle,)
          ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Color(0xff182949)),
                child: Text(
                  appTitle, 
                  style: Boilerplate2.titleStyle,
                  )
              ),
              ListTile(
                leading: Icon(Icons.favorite, color: Color(0xff7B7A7A), size: 22,),
                title: Text('Icon: favorite', style: TextStyle(color: Color(0xff7B7A7A), fontSize: 14, fontWeight: FontWeight.w500,),),
              )
            ],

          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // padding: EdgeInsets.all(10),
            children: [
              Card(
                color: Colors.white,
                shape: BeveledRectangleBorder(),
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(16, 14, 13, 12),
                  leading: Icon(Icons.airplay_outlined),
                  title: Text('This is List Tile', style: Boilerplate2.ListTileTitleStyle,),
                  subtitle: Text('List Tile 1', style: Boilerplate2.ListTileSubtitleStyle,),
                ),
              ),
              Card(
                color: Colors.white,
                shape: BeveledRectangleBorder(),
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(16, 14, 13, 12),
                  leading: Icon(Icons.airplay_outlined),
                  title: Text('This is List Tile', style: Boilerplate2.ListTileTitleStyle,),
                  subtitle: Text('List Tile 2', style: Boilerplate2.ListTileSubtitleStyle,),
                ),
              ),
              Card(
                color: Colors.white,
                shape: BeveledRectangleBorder(),
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(16, 14, 13, 12),
                  leading: Icon(Icons.airplay_outlined),
                  title: Text('This is List Tile', style: Boilerplate2.ListTileTitleStyle,),
                  subtitle: Text('List Tile 3', style: Boilerplate2.ListTileSubtitleStyle,),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  style: ButtonStyle(
                  ),
                  onPressed: (){}, 
                  child: Text('Text Button', style: TextStyle(color: Colors.black),),                
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Ink(
                  width: 40, height: 40,
                  decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Color(0xff182942),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings, color: Colors.white,),
                ),
                )
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: OutlinedButton(
                      onPressed: (){}, 
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xffFEE8E8),
                        side: BorderSide(
                          color: Color(0xffFEE8E8),
                        )
                      ),
                      child: Text('Outlined button', style: TextStyle(color: Colors.black),),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  FloatingActionButton(
                    onPressed: (){},
                    backgroundColor: Color(0xff182942),
                    shape: CircleBorder(),
                    child: Icon(Icons.add, color: Colors.white,),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Divider(
                height: 20,
                thickness: 1,
                color: Colors.black,
              ),
              Center(
                child: Text(
                  'Copyright 2022 SODA All rights reserved.', 
                  style: TextStyle(
                    color: Color.fromARGB(255, 99, 99, 99),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  )
                ),
              )
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}