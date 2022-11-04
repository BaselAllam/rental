import 'package:flutter/material.dart';
import 'package:rental/home_page.dart';
import 'package:rental/map_screen.dart';
import 'package:rental/product/productController/product_cotroller.dart';
import 'package:rental/shared/sharedTheme/sharedColor.dart';
import 'package:rental/shared/sharedTheme/sharedFonts.dart';
import 'package:rental/wishlist.dart';
import 'package:provider/provider.dart';



class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  final List<Widget> screens = [HomePage(), MapScreen(), Wishlist()];
  int cureentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Hi Adam', style: SharedFonts.subTealStyle),
          actions: [
            Container(
              height: 50.0,
              width: 50.0,
              margin: EdgeInsets.only(top: 5.0, right: 5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/pp.jpg'),
                  fit: BoxFit.fill
                )
              ),
            )
          ],
        ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: SharedColors.tealColor
        ),
        margin: EdgeInsets.all(10.0),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: SharedColors.tealColor,
              tooltip: 'Home Item',
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              backgroundColor: SharedColors.tealColor,
              tooltip: 'Locations',
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              backgroundColor: SharedColors.tealColor,
              tooltip: 'Wishlist',
              label: ''
            ),
          ],
          currentIndex: cureentScreen,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconSize: 20.0,
          selectedItemColor: Colors.white,
          unselectedItemColor: SharedColors.greyColor,
          onTap: (index) {
            cureentScreen = index;
            setState(() {
              
            });
          },
        ),
      ),
      body: screens[cureentScreen],
    );
  }
}