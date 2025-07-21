import 'package:drips_water/Screens/cart_page.dart';
import 'package:drips_water/Screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:drips_water/size_helper.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

int quantity = 1;

class _ProductPageState extends State<ProductPage> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeHelper.fromFigmaHeight(context, 346),
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/product_page/product1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: SizeHelper.fromFigmaHeight(context, 50),
                right: 10,
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: SizeHelper.fromFigmaHeight(context, 45),
                        width: SizeHelper.fromFigmaWidth(context, 45),
                        decoration: BoxDecoration(
                          color: const Color(0xff212121),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border,
                              color: Colors.white, size: 23),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: SizeHelper.fromFigmaHeight(context, 45),
                        width: SizeHelper.fromFigmaWidth(context, 45),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: IconButton(
                            alignment: Alignment.center,
                            icon: const Icon(Icons.shopping_bag_outlined,
                                color: Color(0xff3FBDF1), size: 23),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartPage(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeHelper.fromFigmaWidth(context, 15),
                  vertical: SizeHelper.fromFigmaHeight(context, 30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Drips Spring water",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeHelper.fromFigmaFontSize(context, 20),
                        ),
                      ),
                      Text(
                        "(Available In Stock)",
                        style: GoogleFonts.poppins(
                          color: const Color(0xff7D7D7D),
                          fontWeight: FontWeight.w400,
                          fontSize: SizeHelper.fromFigmaFontSize(context, 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "\$100",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeHelper.fromFigmaFontSize(context, 19),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeHelper.fromFigmaFontSize(context, 12),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        "4.5",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeHelper.fromFigmaFontSize(context, 14),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "(128 reviews)",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Color(0xffAAAAAA),
                          fontSize: SizeHelper.fromFigmaFontSize(context, 12),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bottle size",
                            style: GoogleFonts.poppins(
                              color: Color(0xff000000),
                              fontSize:
                                  SizeHelper.fromFigmaFontSize(context, 11),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: SizeHelper.fromFigmaHeight(context, 40),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff3FBDF1)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButton<String>(
                              dropdownColor: Color(0xffffffff),
                              value: "50ml",
                              style: GoogleFonts.poppins(
                                color: Color(0xff625D5D),
                                fontSize:
                                    SizeHelper.fromFigmaFontSize(context, 16),
                                fontWeight: FontWeight.w500,
                              ),
                              underline: const SizedBox(),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: ["50ml", "100ml"].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Quantity",
                            style: GoogleFonts.poppins(
                              color: Color(0xff000000),
                              fontSize:
                                  SizeHelper.fromFigmaFontSize(context, 11),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (quantity > 0) {
                                    setState(() {
                                      quantity--;
                                    });
                                  }
                                },
                                child: Container(
                                  height:
                                      SizeHelper.fromFigmaHeight(context, 42),
                                  width: SizeHelper.fromFigmaWidth(context, 42),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF8F5F5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Color(0xff625D5D),
                                    size: 25,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                quantity.toString(),
                                style: GoogleFonts.poppins(
                                  color: Color(0xff625D5D),
                                  fontSize:
                                      SizeHelper.fromFigmaFontSize(context, 14),
                                ),
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                child: Container(
                                  height:
                                      SizeHelper.fromFigmaHeight(context, 42),
                                  width: SizeHelper.fromFigmaWidth(context, 42),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF8F5F5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Color(0xff625D5D),
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: SizeHelper.fromFigmaHeight(context, 51),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutScreen(),
                              ),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3FBDF1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "BUY",
                        style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeHelper.fromFigmaFontSize(context, 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
