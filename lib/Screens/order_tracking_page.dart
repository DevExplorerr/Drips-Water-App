import 'package:drips_water/Screens/home_page.dart';
import 'package:drips_water/size_helper.dart';
import 'package:drips_water/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeHelper.fromFigmaWidth(context, 20),
            vertical: SizeHelper.fromFigmaHeight(context, 10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Track Order",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: blueColor,
                      fontSize: SizeHelper.fromFigmaFontSize(context, 20)),
                ),
                IconButton(
                  style: IconButton.styleFrom(overlayColor: blueColor),
                  icon: Icon(
                    Icons.close,
                    color: blackColor,
                    size: 30,
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
                ),
              ],
            ),
            SizedBox(height: SizeHelper.fromFigmaHeight(context, 30)),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        size: 10,
                        color: lightGreyColor,
                      ),
                      SizedBox(width: SizeHelper.fromFigmaWidth(context, 8)),
                      Text(
                        "From",
                        style: GoogleFonts.poppins(
                          fontSize: SizeHelper.fromFigmaFontSize(context, 12),
                          color: lightGreyColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: SizeHelper.fromFigmaWidth(context, 8)),
                      Text(
                        "Drip HQ",
                        style: GoogleFonts.poppins(
                          fontSize: SizeHelper.fromFigmaFontSize(context, 16),
                          color: darkGreyColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeHelper.fromFigmaHeight(context, 10)),
                  Row(
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        size: 10,
                        color: lightGreyColor,
                      ),
                      SizedBox(width: SizeHelper.fromFigmaWidth(context, 8)),
                      Text(
                        "To",
                        style: GoogleFonts.poppins(
                          fontSize: SizeHelper.fromFigmaFontSize(context, 12),
                          color: lightGreyColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: SizeHelper.fromFigmaWidth(context, 10)),
                      Text(
                        "2 Pius volta Crescent",
                        style: GoogleFonts.poppins(
                          fontSize: SizeHelper.fromFigmaFontSize(context, 16),
                          color: darkGreyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeHelper.fromFigmaHeight(context, 20)),
            Container(
              height: SizeHelper.fromFigmaHeight(context, 56),
              width: SizeHelper.fromFigmaWidth(context, double.infinity),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xff393939),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Estimated Time of Delivery",
                    style: GoogleFonts.rubik(
                      fontSize: SizeHelper.fromFigmaFontSize(context, 14),
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "4 days",
                    style: GoogleFonts.poppins(
                      fontSize: SizeHelper.fromFigmaFontSize(context, 14),
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeHelper.fromFigmaHeight(context, 30)),
            _buildTrackingStep(
              context,
              icon: Icons.shopping_bag_outlined,
              title: "Order Made",
              subtitle: "Your order has been confirmed",
              isCompleted: true,
            ),
            _buildTrackingStep(
              context,
              icon: Icons.inventory_2_outlined,
              title: "Packaged & Labelled",
              subtitle: "Your good has been packaged and sent to",
              isCompleted: true,
            ),
            _buildTrackingStep(
              context,
              icon: Icons.local_shipping_outlined,
              title: "Toronto Eaton Centre",
              subtitle: "2 stops (20 min)",
              isCompleted: false,
            ),
            _buildTrackingStep(
              context,
              icon: Icons.location_on_outlined,
              title: "My Location",
              subtitle: "Destination",
              isCompleted: false,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingStep(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      bool isCompleted = false,
      bool isLast = false}) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeHelper.fromFigmaWidth(context, 20)),
          child: Container(
            margin: const EdgeInsets.only(left: 14),
            height: 60,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: isCompleted ? blueColor : Colors.grey.shade300,
                  width: 3,
                ),
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: blackColor,
                ),
              ],
            ),
            SizedBox(width: SizeHelper.fromFigmaWidth(context, 40)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.rubik(
                      color: darkGreyColor,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeHelper.fromFigmaFontSize(context, 16),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: lightGreyColor,
                    ),
                  ),
                  SizedBox(height: SizeHelper.fromFigmaHeight(context, 20)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
