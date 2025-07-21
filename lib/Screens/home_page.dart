// ignore_for_file: depend_on_referenced_packages, deprecated_member_use

import 'package:drips_water/Screens/cart_page.dart';
import 'package:drips_water/Screens/chat_screen.dart';
import 'package:drips_water/widgets/slider.dart';
import 'package:drips_water/widgets/top_section.dart';
import 'package:drips_water/widgets/water_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const CartPage(),
    Center(child: Text("Favorites Page")),
    ChatScreen()
  ];

  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.shopping_cart_outlined,
    Icons.favorite_border,
    Icons.chat_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff3FBDF1),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_icons.length, (index) {
              final isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _icons[index],
                      size: 28,
                      color: isSelected ? const Color(0xff000000) : Colors.grey,
                    ),
                    const SizedBox(height: 4),
                    if (isSelected)
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff3FBDF1),
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TopSection(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSlider(),
                  SizedBox(height: screenHeight * 0.04),
                  Text(
                    "Water type",
                    style: GoogleFonts.rubik(
                      color: const Color(0xff000000),
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        waterTypeContainer(
                            const Color(0xff212121), "All", screenWidth),
                        SizedBox(width: screenWidth * 0.025),
                        waterTypeContainer(
                            const Color(0x99212121), "Distilled", screenWidth),
                        SizedBox(width: screenWidth * 0.025),
                        waterTypeContainer(
                            const Color(0x99212121), "Spring", screenWidth),
                        SizedBox(width: screenWidth * 0.025),
                        waterTypeContainer(
                            const Color(0x99212121), "Purified", screenWidth),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  const WaterGridPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget waterTypeContainer(Color color, String text, double screenWidth) {
    return Container(
      height: screenWidth * 0.1,
      width: screenWidth * 0.23,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(screenWidth * 0.025),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: const Color(0xffFFFFFF),
            fontSize: screenWidth * 0.03,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
