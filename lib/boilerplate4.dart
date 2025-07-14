import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const TextStyle DAYstyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 30,
    letterSpacing: 0.15,
  ); // DAY 8 style

  static const TextStyle cardTitleStyle = TextStyle(
    color: Color.fromARGB(200, 0, 0, 0),
    fontWeight: FontWeight.w500,
    fontSize: 20,
    letterSpacing: 0.15,
  ); // DAY 8 아래 card title

  static const TextStyle cardTextStyle = TextStyle(
    color: Color.fromARGB(141, 0, 0, 0),
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.25,
  ); // DAY 8 아래 본문 style

  static const TextStyle buttonStyle = TextStyle(
    color: Color(0xff4B6EB1),
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 1.25,
  ); // 버튼 style

  static const TextStyle SelectedchipLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 0.25,
  ); // chip label style (selected)

  static const TextStyle UnselectedchipLabelStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 0.25,
  ); // chip label style (unselected)

  static TextStyle chipLabelStyle = SelectedchipLabelStyle;

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
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int selectedIndex = 0;

  int selectedChoiceIndex = 0;

  void handleChoiceSelected(int index) {
    setState(() {
      selectedChoiceIndex = index;
    });
  }

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
          title: const Text(appTitle, style: MyApp.titleStyle,)
          ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Color(0xff182949)),
                child: Text(
                  appTitle, 
                  style: MyApp.titleStyle,
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
          padding: const EdgeInsets.fromLTRB(19, 35, 16, 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('DAY 8', style: MyApp.DAYstyle,),
                  Expanded(child: Container()),
                ],
              ),
              Theme(
                data: ThemeData(useMaterial3: false),
                child: Card.outlined(
                  
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(4)),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(16, 14, 16, 12),
                        title: Text('Boilerplate 4', style: MyApp.cardTitleStyle,),
                        subtitle: Text(
                          '어느덧 SODA 캠프 8일차가 되었네요!\n여기까지 달려오시느라 수고 많으셨어요 :)\n\n아래 있는 CANCEL과 SUBMIT은 버튼입니다 !!',
                          style: MyApp.cardTextStyle,
                        )
                      ),
                      SizedBox(height: 18,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: (){}, 
                            child: Text('CANCEL', style: MyApp.buttonStyle,)
                          ),
                          TextButton(
                            onPressed: (){}, 
                            child: Text('SUBMIT', style: MyApp.buttonStyle,)
                          ),                          
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10,
                    children: [
                      Theme(
                        data: ThemeData(useMaterial3: false),
                        child: ChoiceChip(

                          showCheckmark: false,
                          label: Text('SODA', style: TextStyle(color: selectedChoiceIndex == 0 ? Colors.white : Colors.black),), 
                          labelStyle: MyApp.chipLabelStyle,
                          selected: selectedChoiceIndex == 0,
                          onSelected: (bool selected) {
                            setState(() {
                              handleChoiceSelected(0);
                            });
                          },
                          backgroundColor: Color.fromRGBO(33, 33, 33, 0.08),
                          selectedColor: Color(0xff182942),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(Radius.circular(16))
                          ),
                        ),
                      ),
                      Theme(
                        data: ThemeData(useMaterial3: false),
                        child: ChoiceChip(
                          showCheckmark: false,
                          label: Text('CAMP', style: TextStyle(color: selectedChoiceIndex == 1 ? Colors.white : Colors.black),), 
                          labelStyle: MyApp.chipLabelStyle,
                          selected: selectedChoiceIndex == 1,
                          onSelected: (bool selected) {
                            setState(() {
                              handleChoiceSelected(1);
                            });
                          },
                          backgroundColor: Color.fromRGBO(33, 33, 33, 0.08),
                          selectedColor: Color(0xff182942),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(Radius.circular(16))
                          ),
                        ),
                      ),
                      Theme(
                        data: ThemeData(useMaterial3: false),
                        child: ChoiceChip(
                          showCheckmark: false,
                          label: Text('FUN', style: TextStyle(color: selectedChoiceIndex == 2 ? Colors.white : Colors.black),), 
                          labelStyle: MyApp.chipLabelStyle,
                          selected: selectedChoiceIndex == 2,
                          onSelected: (bool selected) {
                            setState(() {
                              handleChoiceSelected(2);
                            });
                          },
                          backgroundColor: Color.fromRGBO(33, 33, 33, 0.08),
                          selectedColor: Color(0xff182942),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(Radius.circular(16))
                          ),
                        ),
                      ),
                      Theme(
                        data: ThemeData(useMaterial3: false),
                        child: ChoiceChip(
                          showCheckmark: false,
                          label: Text('FLUTTER', style: TextStyle(color: selectedChoiceIndex == 3 ? Colors.white : Colors.black),), 
                          labelStyle: MyApp.chipLabelStyle,
                          selected: selectedChoiceIndex == 3,
                          onSelected: (bool selected) {
                            setState(() {
                              handleChoiceSelected(3);
                            });
                          },
                          backgroundColor: Color.fromRGBO(33, 33, 33, 0.08),
                          selectedColor: Color(0xff182942),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(Radius.circular(16))
                          ),
                        ),
                      ),
                    ]
                  ),
                ],
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Tooltip(
                    preferBelow: false,
                    showDuration: Duration(seconds: 3),
                    message: 'Tooltip',
                    child: FloatingActionButton(
                      onPressed: (){},
                      backgroundColor: Color(0xff182942),
                      shape: CircleBorder(),
                      child: Icon(Icons.add, color: Colors.white,),
                    ),
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