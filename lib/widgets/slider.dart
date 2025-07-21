// ignore_for_file: depend_on_referenced_packages

import 'package:drips_water/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int currentIndex = 0;
  final PageController pageController = PageController();

  final List<Map<String, String>> sliderData = [
    {
      'image': 'assets/images/home_screen/slider_image.png',
      'image1': 'assets/images/home_screen/slider_shade.png',
      'title': 'Drips Springs',
      'description': 'Bottle water delivery'
    },
    {
      'image': 'assets/images/home_screen/slider_image1.png',
      'image1': 'assets/images/home_screen/slider_shade1.png',
      'title': 'Drips Springs',
      'description': 'Bottle water delivery'
    }
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: SizeHelper.fromFigmaHeight(context, 170),
          width: SizeHelper.fromFigmaWidth(context, 400),
          child: PageView.builder(
            controller: pageController,
            itemCount: sliderData.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(sliderData[index]['image']!),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(sliderData[index]['image1']!),
                        fit: BoxFit.fill,
                      ),
                    ),
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.04,
                      right: screenWidth * 0.03,
                      top: screenHeight * 0.03,
                      bottom: screenHeight * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sliderData[index]['title']!,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          sliderData[index]['description']!,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffFFC33A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.04,
                                vertical:
                                    SizeHelper.fromFigmaHeight(context, 15),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Quick Shop",
                              style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        _buildPageIndicator(screenWidth),
      ],
    );
  }

  Widget _buildPageIndicator(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        sliderData.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
          height: 8,
          width: currentIndex == index ? 20 : 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? const Color(0xff625D5D)
                : Colors.grey[400],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
