import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(1, 108, 144, 1),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          // Logo
          Image.asset(
            'images/vint.png',
            height: 40, // Adjust height as needed
            width: 40,  // Adjust width as needed
          ),
          
          SizedBox(width: 15), // Spacing between logo and search widget

          // Search Widget
          Expanded(child: SearchWidget()),

          SizedBox(width: 20), // Add some spacing if needed

          // Badge and Cart Icon
          badges.Badge(
            badgeStyle: badges.BadgeStyle(
              badgeColor: Colors.red,
              padding: EdgeInsets.all(7),
            ),
            badgeContent: Text(
              "3",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "cartPage");
              },
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 32,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
