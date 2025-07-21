// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'package:drips_water/Screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WaterGridPage extends StatelessWidget {
  const WaterGridPage({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      "image": "assets/images/home_screen/water1.png",
      "name": "Drips Spring Water",
      "price": "\$100"
    },
    {
      "image": "assets/images/home_screen/water2.png",
      "name": "Drips Distilled Water",
      "price": "\$200"
    },
    {
      "image": "assets/images/home_screen/water3.png",
      "name": "Drips Spring Water",
      "price": "\$100"
    },
    {
      "image": "assets/images/home_screen/water4.png",
      "name": "Drips Spring Water",
      "price": "\$100"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.05),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: screenWidth * 0.03,
          mainAxisSpacing: screenHeight * 0.02,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) {
          final item = products[index];
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductPage()));
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                        child: Image.asset(
                          item['image'],
                          height: screenHeight * 0.18,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: screenHeight * 0.015,
                        right: screenWidth * 0.03,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xff000000), Color(0xffDCDCDC)],
                              stops: [0.0, 1.0],
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.015),
                            child: const Icon(
                              Icons.favorite_border,
                              color: Color(0xffFFFFFF),
                              size: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
                  child: Text(
                    item['name'],
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff000000),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
                  child: Text(
                    item['price'],
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.03,
                      color: const Color(0xff484848),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
