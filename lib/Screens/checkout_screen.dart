// ignore_for_file: unused_local_variable

import 'package:drips_water/Screens/order_succes_page.dart';
import 'package:drips_water/size_helper.dart';
import 'package:drips_water/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

String deliveryOption = "standard";
bool showCalendar = false;

class _CheckoutScreenState extends State<CheckoutScreen> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  String selectedTime = "13:00";

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          style: IconButton.styleFrom(overlayColor: Colors.transparent),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: SizeHelper.fromFigmaHeight(context, 24),
            color: const Color(0xff3FBDF1),
          ),
        ),
        title: Text(
          "Checkout",
          style: GoogleFonts.poppins(
            fontSize: SizeHelper.fromFigmaFontSize(context, 20),
            fontWeight: FontWeight.bold,
            color: blueColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeHelper.fromFigmaWidth(context, 15),
          vertical: SizeHelper.fromFigmaHeight(context, 25),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Address",
                    style: GoogleFonts.poppins(
                      fontSize: SizeHelper.fromFigmaFontSize(context, 16),
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      overlayColor: blueColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Change",
                      style: GoogleFonts.poppins(
                        fontSize: SizeHelper.fromFigmaFontSize(context, 14),
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeHelper.fromFigmaHeight(context, 10)),
              deliveryAddress(context),
              SizedBox(height: SizeHelper.fromFigmaHeight(context, 20)),
              Row(
                children: [
                  _deliveryTimeSelection(
                    context,
                    143,
                    "Standard",
                    "10-20 Min",
                    "standard",
                  ),
                  SizedBox(width: SizeHelper.fromFigmaWidth(context, 10)),
                  _deliveryTimeSelection(
                    context,
                    190,
                    "Schedule Ahead",
                    "Choose Your Time",
                    "schedule",
                  ),
                ],
              ),
              if (showCalendar)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: _calendar(context),
                ),
              SizedBox(height: SizeHelper.fromFigmaHeight(context, 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment",
                    style: GoogleFonts.poppins(
                      fontSize: SizeHelper.fromFigmaFontSize(context, 14),
                      fontWeight: FontWeight.bold,
                      color: greyColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: greyColor,
                          size: 10,
                        ),
                        SizedBox(
                          width: SizeHelper.fromFigmaWidth(context, 5),
                        ),
                        Text(
                          "Add New Card",
                          style: GoogleFonts.poppins(
                            fontSize: SizeHelper.fromFigmaFontSize(context, 10),
                            fontWeight: FontWeight.w400,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeHelper.fromFigmaHeight(context, 20)),
              Center(child: _creditCard(context)),
              SizedBox(height: SizeHelper.fromFigmaHeight(context, 50)),
              _total(context),
              SizedBox(height: SizeHelper.fromFigmaHeight(context, 50)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(
          horizontal: SizeHelper.fromFigmaWidth(context, 15),
          vertical: SizeHelper.fromFigmaHeight(context, 30),
        ),
        height: SizeHelper.fromFigmaHeight(context, 110),
        color: Colors.transparent,
        elevation: 0,
        child: _placeOrderButton(context),
      ),
    );
  }

  Widget deliveryAddress(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Home Address",
          style: GoogleFonts.poppins(
            fontSize: SizeHelper.fromFigmaFontSize(context, 13),
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),
        Text(
          "123 Street, Karachi, Pakistan",
          style: GoogleFonts.poppins(
            fontSize: SizeHelper.fromFigmaFontSize(context, 13),
            fontWeight: FontWeight.w400,
            color: blackColor,
          ),
        ),
        Text(
          "+92 3467464387",
          style: GoogleFonts.poppins(
            fontSize: SizeHelper.fromFigmaFontSize(context, 13),
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),
      ],
    );
  }

  Widget _deliveryTimeSelection(
    BuildContext context,
    double width,
    String text,
    String timeText,
    String value,
  ) {
    final isSelected = deliveryOption == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          deliveryOption = value;
          showCalendar = value == "schedule";
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeHelper.fromFigmaWidth(context, 8),
          vertical: SizeHelper.fromFigmaHeight(context, 5),
        ),
        height: SizeHelper.fromFigmaHeight(context, 52),
        width: SizeHelper.fromFigmaWidth(context, width),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: isSelected ? blueColor : blackColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: GoogleFonts.rubik(
                    fontSize: SizeHelper.fromFigmaFontSize(context, 12),
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                ),
                Text(
                  timeText,
                  style: GoogleFonts.rubik(
                    fontSize: SizeHelper.fromFigmaFontSize(context, 12),
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                ),
              ],
            ),
            Icon(
              isSelected
                  ? Icons.check_box
                  : Icons.check_box_outline_blank_sharp,
              size: SizeHelper.fromFigmaHeight(context, 22),
              color: isSelected ? blueColor : blackColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _calendar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date",
          style: GoogleFonts.poppins(
              color: blackColor,
              fontWeight: FontWeight.bold,
              fontSize: SizeHelper.fromFigmaFontSize(context, 16)),
        ),
        TableCalendar(
          locale: "en_US",
          rowHeight: SizeHelper.fromFigmaHeight(context, 40),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: const Color(0xffE3F2FD),
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: blueColor,
              shape: BoxShape.circle,
            ),
            todayTextStyle: GoogleFonts.poppins(
              color: blueColor,
              fontWeight: FontWeight.bold,
            ),
            selectedTextStyle: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            defaultTextStyle: GoogleFonts.poppins(
              color: Colors.black,
            ),
            weekendTextStyle: GoogleFonts.poppins(
              color: Colors.red,
            ),
            outsideTextStyle: GoogleFonts.poppins(
              color: Colors.grey,
            ),
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            leftChevronIcon:
                const Icon(Icons.chevron_left, color: Colors.black),
            rightChevronIcon:
                const Icon(Icons.chevron_right, color: Colors.black),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekendStyle: GoogleFonts.poppins(
              color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
            weekdayStyle: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(day, today),
          onDaySelected: _onDaySelected,
          focusedDay: today,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime(2030, 10, 16),
        ),
        SizedBox(height: SizeHelper.fromFigmaHeight(context, 20)),
        Text(
          "Time",
          style: GoogleFonts.poppins(
              color: blackColor,
              fontWeight: FontWeight.bold,
              fontSize: SizeHelper.fromFigmaFontSize(context, 16)),
        ),
        SizedBox(height: SizeHelper.fromFigmaHeight(context, 10)),
        SizedBox(
          height: SizeHelper.fromFigmaHeight(context, 50),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _timeContainer(context, "13:00"),
              SizedBox(width: SizeHelper.fromFigmaWidth(context, 10)),
              _timeContainer(context, "15:45"),
              SizedBox(width: SizeHelper.fromFigmaWidth(context, 10)),
              _timeContainer(context, "13:15"),
              SizedBox(width: SizeHelper.fromFigmaWidth(context, 10)),
              _timeContainer(context, "17:35"),
              SizedBox(width: SizeHelper.fromFigmaWidth(context, 10)),
              _timeContainer(context, "18:50"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _timeContainer(BuildContext context, String timeText) {
    final bool isselected = selectedTime == timeText;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = timeText;
        });
      },
      child: Container(
        height: SizeHelper.fromFigmaHeight(context, 50),
        width: SizeHelper.fromFigmaWidth(context, 79),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
          color: isselected ? blueColor : darkWhiteColor,
        ),
        child: Center(
          child: Text(
            timeText,
            style: GoogleFonts.poppins(
                color: isselected ? whiteColor : blackColor,
                fontWeight: FontWeight.bold,
                fontSize: SizeHelper.fromFigmaFontSize(context, 20)),
          ),
        ),
      ),
    );
  }

  Widget _creditCard(BuildContext context) {
    return Container(
      height: SizeHelper.fromFigmaHeight(context, 136),
      width: SizeHelper.fromFigmaWidth(context, 269),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
        color: purpleColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "VISA",
              style: GoogleFonts.montserrat(
                fontSize: SizeHelper.fromFigmaFontSize(context, 15),
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            ),
            SizedBox(height: SizeHelper.fromFigmaHeight(context, 10)),
            Text(
              "****  ****  ****  ****  3282",
              style: GoogleFonts.poppins(
                fontSize: SizeHelper.fromFigmaFontSize(context, 15),
                fontWeight: FontWeight.w400,
                color: whiteColor,
              ),
            ),
            SizedBox(height: SizeHelper.fromFigmaHeight(context, 13)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Card Holder",
                      style: GoogleFonts.poppins(
                        fontSize: SizeHelper.fromFigmaFontSize(context, 10),
                        fontWeight: FontWeight.w300,
                        color: whiteColor,
                      ),
                    ),
                    SizedBox(height: SizeHelper.fromFigmaHeight(context, 2)),
                    Text(
                      "Saad Jamal",
                      style: GoogleFonts.poppins(
                        fontSize: SizeHelper.fromFigmaFontSize(context, 13),
                        fontWeight: FontWeight.w400,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Expires",
                      style: GoogleFonts.poppins(
                        fontSize: SizeHelper.fromFigmaFontSize(context, 10),
                        fontWeight: FontWeight.w300,
                        color: whiteColor,
                      ),
                    ),
                    Text(
                      "12/23",
                      style: GoogleFonts.poppins(
                        fontSize: SizeHelper.fromFigmaFontSize(context, 13),
                        fontWeight: FontWeight.w400,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _total(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sub Total",
              style: GoogleFonts.poppins(
                fontSize: SizeHelper.fromFigmaFontSize(context, 14),
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
            SizedBox(height: SizeHelper.fromFigmaHeight(context, 10)),
            Text(
              "Delivery fee",
              style: GoogleFonts.poppins(
                fontSize: SizeHelper.fromFigmaFontSize(context, 14),
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
            SizedBox(height: SizeHelper.fromFigmaHeight(context, 10)),
            Text(
              "Total",
              style: GoogleFonts.poppins(
                fontSize: SizeHelper.fromFigmaFontSize(context, 14),
                fontWeight: FontWeight.bold,
                color: greyColor,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "\$100",
              style: GoogleFonts.poppins(
                fontSize: SizeHelper.fromFigmaFontSize(context, 18),
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
            SizedBox(height: SizeHelper.fromFigmaHeight(context, 10)),
            Text(
              "\$10",
              style: GoogleFonts.poppins(
                fontSize: SizeHelper.fromFigmaFontSize(context, 18),
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
            SizedBox(height: SizeHelper.fromFigmaHeight(context, 10)),
            Text(
              "\$110",
              style: GoogleFonts.poppins(
                fontSize: SizeHelper.fromFigmaFontSize(context, 18),
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _placeOrderButton(BuildContext context) {
    return SizedBox(
      height: SizeHelper.fromFigmaHeight(context, 51),
      width: SizeHelper.fromFigmaWidth(context, double.infinity),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)),
          backgroundColor: blueColor,
          overlayColor: whiteColor,
        ),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => OrderSuccesPage()));
        },
        child: Text(
          "Place Order",
          style: GoogleFonts.rubik(
            fontSize: SizeHelper.fromFigmaFontSize(context, 16),
            fontWeight: FontWeight.w500,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
