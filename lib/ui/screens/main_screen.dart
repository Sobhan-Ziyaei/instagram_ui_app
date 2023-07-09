import 'package:flutter/material.dart';
import 'package:instagram_ui_app/data/constants/custom_color.dart';
import 'package:instagram_ui_app/ui/screens/activity_screen.dart';
import 'package:instagram_ui_app/ui/screens/add_post_screen.dart';
import 'package:instagram_ui_app/ui/screens/home_screen.dart';
import 'package:instagram_ui_app/ui/screens/search_screen.dart';
import 'package:instagram_ui_app/ui/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedScreenLayout = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: CustomColor.black,
            currentIndex: _selectedScreenLayout,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (value) {
              setState(() {
                _selectedScreenLayout = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_home.png'),
                activeIcon: Image.asset('assets/images/icon_active_home.png'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_search_navigation.png'),
                activeIcon: Image.asset(
                    'assets/images/icon_search_navigation_active.png'),
                label: 'Exolorer',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_add_navigation.png'),
                activeIcon:
                    Image.asset('assets/images/icon_add_navigation_active.png'),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_activity_navigation.png'),
                activeIcon: Image.asset(
                    'assets/images/icon_activity_navigation_active.png'),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: CustomColor.grey),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('assets/images/profile.jpg'),
                    ),
                  ),
                ),
                activeIcon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: CustomColor.pink),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('assets/images/profile.jpg'),
                    ),
                  ),
                ),
                label: 'profile',
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedScreenLayout,
        children: getLayouts(),
      ),
    );
  }

  List<Widget> getLayouts() {
    return <Widget>[
      const HomeScreen(),
      const SearchScreen(),
      const AddPostScreen(),
      const ActivityScreen(),
      const UserProfileScreen(),
    ];
  }
}
