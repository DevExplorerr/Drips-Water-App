import 'package:drips_water/Screens/order_tracking_page.dart';
import 'package:drips_water/size_helper.dart';
import 'package:drips_water/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSuccesPage extends StatelessWidget {
  const OrderSuccesPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xffffffff),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeHelper.fromFigmaWidth(context, 30),
              vertical: SizeHelper.fromFigmaHeight(context, 40)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/order_success/box.png'),
              SizedBox(height: SizeHelper.fromFigmaHeight(context, 40)),
              Text(
                "Order Successful",
                style: GoogleFonts.poppins(
                  fontSize: SizeHelper.fromFigmaFontSize(context, 18),
                  fontWeight: FontWeight.bold,
                  color: greyColor,
                ),
              ),
              SizedBox(height: SizeHelper.fromFigmaHeight(context, 15)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeHelper.fromFigmaWidth(context, 20)),
                child: Text(
                  textAlign: TextAlign.center,
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sed ornare ligula, vel luctus quam. Quisque lobortis semper neque at porta.",
                  style: GoogleFonts.poppins(
                    fontSize: SizeHelper.fromFigmaFontSize(context, 12),
                    fontWeight: FontWeight.w400,
                    color: greyColor,
                  ),
                ),
              ),
              SizedBox(height: SizeHelper.fromFigmaHeight(context, 40)),
              SizedBox(
                height: SizeHelper.fromFigmaHeight(context, 55),
                width: SizeHelper.fromFigmaWidth(context, double.infinity),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    overlayColor: whiteColor,
                    backgroundColor: blueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Continue Shopping",
                    style: GoogleFonts.poppins(
                      fontSize: SizeHelper.fromFigmaFontSize(context, 16),
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeHelper.fromFigmaHeight(context, 20)),
              TextButton(
                style: TextButton.styleFrom(overlayColor: blueColor),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderTrackingPage()));
                },
                child: Text(
                  "Track Order",
                  style: GoogleFonts.poppins(
                    fontSize: SizeHelper.fromFigmaFontSize(context, 16),
                    fontWeight: FontWeight.w600,
                    color: greyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
