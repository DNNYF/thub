import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:vint/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:vint/views/pages/widgets/CategoriesWidget.dart';
import 'package:vint/views/pages/widgets/HomeAppBar.dart';
import 'package:vint/views/pages/widgets/ImageCarousel.dart';
import 'package:vint/views/pages/widgets/ItemsWidget.dart';
import 'package:vint/views/pages/widgets/PopularCategoryWidget.dart';
import 'package:vint/views/pages/widgets/PopularStoreWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                // Image Slider
                ImageCarousel(),

                // Categories
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Text(
                    "Kategori Produk",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                // Kategori Produk Widget
                CategoriesWidget(),

                // Kategori Populer
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Text(
                    "Kategori Populer",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                // Kategori Populer Widget
                PopularCategoryWidget(),

                // Toko Populer
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                  ),
                  child: Text(
                    "Toko Populer",
                    style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    ),
                  ),
                ),

                // Toko Populer Widget
                PopularStoreWidget(),

                // Items
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    "Item Populer",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                // Items Widget
                ItemsWidget(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {},
        height: 70,
        color: Colors.lightBlue,
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            CupertinoIcons.cart_fill,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
