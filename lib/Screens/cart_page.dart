// ignore_for_file: depend_on_referenced_packages, deprecated_member_use
import 'package:drips_water/Screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Cart",
          style: GoogleFonts.poppins(
            color: const Color(0xff3FBDF1),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 78,
              width: 78,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/cart_screen/cartproduct_image.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        "Drips Spring water",
                        style: GoogleFonts.poppins(
                          color: const Color(0xff625D5D),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "50ml",
                        style: GoogleFonts.poppins(
                          color: const Color(0xff625D5D),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "\$100",
                    style: GoogleFonts.poppins(
                      color: const Color(0xff3FBDF1),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 13),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: const Color(0xffE3E3E3),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.remove,
                            size: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 13),
                      Text(
                        "1",
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 13),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: const Color(0xffE3E3E3),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: const Color(0xffE3E3E3),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.delete_outline,
                            size: 15,
                            color: Color(0xff979797),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ✅ Bottom Section: Total + Checkout
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TOTAL',
                  style: GoogleFonts.poppins(
                    color: const Color(0xff625D5D),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '\$100',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                'CHECKOUT',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
