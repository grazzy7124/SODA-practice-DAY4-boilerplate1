import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: const SodaPageView(),

        
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SodaPageView extends StatefulWidget {
  const SodaPageView({super.key});

  @override
  State<StatefulWidget> createState() => _SodaPageViewState();
}

class _SodaPageViewState extends State<SodaPageView> with TickerProviderStateMixin {

  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override 
  Widget build(BuildContext conext) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
          PageView(
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
            children: [
              FirsrtPage(),
              SecondPage(),
              ThirdPage(),   
            ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PageIndicator(
              tabController: _tabController,
              currentPageIndex: _currentPageIndex,
              onUpdateCurrentPageIndex: _updateCurrentPageIndex,
            ),
            SizedBox(height: 26,)
          ],
        ),
      ],
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }


}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TabPageSelector(
          controller: tabController,
          color: Color.fromRGBO(216, 216, 216, 1),
          selectedColor: Color.fromRGBO(24, 41, 73, 1),
          borderStyle: BorderStyle.none,
          indicatorSize: 6,
        ),
      ],
    );
  }
}

class FirsrtPage extends StatelessWidget {
  const FirsrtPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(height: 267,),
          SizedBox(
            width: 254, height: 270,
            child: Image.asset('images/boilerplate5/sodaicon.png'),
          ),
          Container(
            height: 36,
            color: Colors.white,
          ),
          Text('Copyright 2023 SODA. All rights reserved.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color.fromRGBO(0, 0, 0, 0.6),
              letterSpacing: 0.1,
            ),              
          )
        ],
      ),
    ); 
  }
} // first page

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(height: 379),
          SizedBox(
            width: 276, height: 86,
            child: Image.asset('images/boilerplate5/soda1.png'),
          ),
        ],
      ),
    ); 
  }
} // second page

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(height: 379),
          SizedBox(
            width: 276, height: 86,
            child: Image.asset('images/boilerplate5/soda2.png'),
          ),
        ],
      ),
    );
  }
} // third page

