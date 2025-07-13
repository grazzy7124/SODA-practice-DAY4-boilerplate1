import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SEX { male, female }

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
  bool isChecked = true;
  SEX? _sex = SEX.male;
  bool checkboxValue1 = true;
  bool checkboxValue2 = true;

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
            Builder(
              builder: (context) {
                return Switch(
                  activeTrackColor: Color(0xff4B6EB1),
                  value: isChecked, 
                  onChanged: (bool value){
                    setState(() {
                      isChecked = value;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('switch를 ON하였습니다.'),
                          action: SnackBarAction(
                            label: 'OK', 
                            onPressed: (){}
                          ),
                        )
                      );
                    });
                  }
                );
              }
            )
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
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                width: 350, height: 73,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEDEDED),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff182942), width: 2),
                    ),
                    hintText: 'Name'
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: RadioListTile<SEX>(
                          contentPadding: EdgeInsets.symmetric(horizontal: 1,),
                          activeColor: Color(0xff4B6EB1),
                          title: Text('Male', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                          value: SEX.male,
                          groupValue: _sex,
                          onChanged: (SEX? value) {
                            setState(() {
                              _sex = value;
                            });
                          }
                        )
                      ),
                      Flexible(
                        flex: 2,
                        child: RadioListTile<SEX>(
                          contentPadding: EdgeInsets.symmetric(horizontal: 1,),
                          activeColor: Color(0xff4B6EB1),
                          title: Text('Female', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                          value: SEX.female,
                          groupValue: _sex,
                          onChanged: (SEX? value) {
                            setState(() {
                              _sex = value;
                            });
                          }
                        )
                      ),
                      Flexible(child: Container(), flex: 1,)
                    ],
                  ),
                  Row(
                    children: [
                      Row( // designer checkbox
                        children: [
                          Checkbox(
                            activeColor: Color(0xff4B6EB1),
                            value: checkboxValue1, 
                            onChanged: (bool? value) {
                              setState(() {
                                checkboxValue1 = value!;
                              });
                            },
                          ),
                          Text('Designer', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(width: 30,),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Color(0xff4B6EB1),
                            value: checkboxValue2, 
                            onChanged: (bool? value) {
                              setState(() {
                                checkboxValue2 = value!;
                              });
                            },
                          ),
                          Text('Developer', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 80,
              ),
              Row( // Text와 DATE 행
                children: [
                  SizedBox(width: 9,),
                  Text('버튼을 눌러 날짜를 선택해 주세요.', style: TextStyle(fontSize: 13, ),),
                  SizedBox(width: 8,),
                  DatePicker(),
                ],
              ),
              SizedBox(height: 275,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Builder(
                    builder: (context) {
                      return FloatingActionButton(
                        onPressed: (){
                          showDialog(
                            context: context, 
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                backgroundColor: Colors.white,
                                content: Text('+ 버튼을 누르셨습니다.', style: TextStyle(color: Color.fromARGB(127, 0, 0, 0)),),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    }, 
                                    child: Text('확인', style: TextStyle(color: Color(0xff182942)),),
                                  )
                                ],
                              );
                            }
                          );
                        },
                        backgroundColor: Color(0xff182942),
                        shape: CircleBorder(),
                        child: Icon(Icons.add, color: Colors.white,),
                      );
                    }
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

class DatePicker extends StatefulWidget {
  const DatePicker ({super.key});

  @override 
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2025, 5, 16),
      firstDate: DateTime(2001),
      lastDate: DateTime(2030),
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 129, height: 36,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))
          ),
        ),
        onPressed: _selectDate, 
        child: const Text('SELECT DATE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff4B6EB1)),)
      ),
    );
  }
}