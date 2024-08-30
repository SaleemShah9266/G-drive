import 'package:drivers_app/tabPages/earning_tab_page.dart';
import 'package:drivers_app/tabPages/home_tab_page.dart';
import 'package:drivers_app/tabPages/profile_tab_page.dart';
import 'package:drivers_app/tabPages/rating_tab_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;  // late keyword for non-nullable
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  void onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController.index = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          HomeTabPage(),
          EarningTabPage(),
          RatingTabPage(),
          ProfileTabPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: "Earning",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Rating",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showSelectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
