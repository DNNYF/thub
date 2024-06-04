import 'package:flutter/material.dart';

class PopularStoreWidget extends StatelessWidget {
  final List<String> popularStores = ["Store A", "Store B", "Store C", "Store D", "Store E"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2, // Adjusted the height to be smaller
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularStores.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.45, // Adjusted width to fit 2 containers on the screen
              child: Material(
                elevation: 3, // Custom elevation for the circle icon
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10, // Adjusted top position to center vertically within the container
                        left: (MediaQuery.of(context).size.width * 0.45 - 60) / 2, // Adjusted to center the icon horizontally within the container
                        child: Container(
                          width: 60, // Width of the circle
                          height: 60, // Height of the circle
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue, // Changed the color to blue
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.store,
                            size: 40, // Size of the icon
                            color: Colors.white, // Changed the color to white
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100, // Positioned the text below the icon
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            popularStores[index],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

