import '/core/view_model/auth_view_model.dart';
import '/Customs/Custom_Font.dart';
import 'Institutions.dart';
import 'LoginPage.dart';
import 'Profile.dart';
import 'Subjects.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<HomePage> {
  int _currentIndex = 0;
  final AuthViewModel controller = AuthViewModel();

  List<Widget> pageList = [Institutions(), Subjects(), Profile()];

  static Map<String, Icon> bottomNavigatorData = {
    'Institutions': const Icon(Icons.school_outlined),
    'Subjects': const Icon(Icons.menu_book_rounded),
    'Profile': const Icon(Icons.person_outline_rounded)
  };
  String _pageTitle = bottomNavigatorData.keys.first;
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => setState(() {
            if (_currentIndex > 0) {
              _pageController.animateToPage(_currentIndex-1, duration: Duration(milliseconds: 500), curve: Curves.ease);
            }
            switch (_currentIndex) {
              case 0:
                _pageTitle = 'Institutions';
                break;
              case 1:
                _pageTitle = 'Subjects';
                break;
              case 2:
                _pageTitle = 'Profile';
                break;
            }
          }),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  Colors.teal[700]!,
                  Colors.teal[200]!,
                  Colors.teal[400]!
                ]),
          ),
        ),
        title: FittedBox(
          child: Text(
            _pageTitle,
            style: TextStyle(
                letterSpacing: 1,
                fontSize: MediaQuery.of(context).size.width * 0.08,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontFamily: 'Cabin'),
          ),
        ),
        actions: [
          Center(child: GestureDetector(
            onTap: (){
              controller.signOut();
              Get.offAll(LoginPage());
            },
            child: FittedBox(
              child: CustomFont(
                      text: 'Logout',
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.2,),
            ),
          )),
          SizedBox(width: 5,)
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex){
          setState(() {
            _currentIndex = newIndex;
            switch (_currentIndex) {
              case 0:
                _pageTitle = 'Institutions';
                break;
              case 1:
                _pageTitle = 'Subjects';
                break;
              case 2:
                _pageTitle = 'Profile';
                break;
            }
          });
        },
        children: pageList,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.white.withOpacity(0.5),
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold
            )
          )
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (newIndex){
            setState(() {
              _currentIndex = newIndex;
              _pageController.animateToPage(newIndex, duration: Duration(milliseconds: 500), curve: Curves.ease);
            });
          },
          destinations: [
          NavigationDestination(
              icon: Icon(Icons.school_outlined), label: 'Institutions'),
            NavigationDestination(
                icon: Icon(Icons.menu_book_rounded), label: 'Subjects'),
            NavigationDestination(
                icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
          ],
          backgroundColor: Colors.teal,
          animationDuration: const Duration(seconds: 1),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 60,
        ),
      ),
    );
  }
}
