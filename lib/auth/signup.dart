// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'package:drips_water/Screens/home_page.dart';
import 'package:drips_water/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();

    void goToHomePage() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }

    void goToSigninPage() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
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
            size: screenWidth * 0.08,
            color: const Color(0xff3FBDF1),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.06,
          vertical: screenHeight * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create your Account",
              style: GoogleFonts.poppins(
                color: const Color(0xff5DCCFC),
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.1),
              child: Text(
                "Please fill in your details to create your account.",
                style: GoogleFonts.poppins(
                  color: const Color(0xff625D5D),
                  fontSize: screenWidth * 0.038,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            textfield(
              keyboardType: TextInputType.text,
              label: "Name",
              hintText: "Enter your name",
              controller: nameController,
              obscureText: false,
              screenWidth: screenWidth,
            ),
            SizedBox(height: screenHeight * 0.025),
            textfield(
              keyboardType: TextInputType.emailAddress,
              label: "Email",
              hintText: "Enter your email",
              controller: emailController,
              obscureText: false,
              screenWidth: screenWidth,
            ),
            SizedBox(height: screenHeight * 0.025),
            textfield(
              keyboardType: TextInputType.visiblePassword,
              label: "Password",
              hintText: "Enter your password",
              controller: passwordController,
              obscureText: true,
              screenWidth: screenWidth,
            ),
            SizedBox(height: screenHeight * 0.025),
            textfield(
              keyboardType: TextInputType.visiblePassword,
              label: "Confirm Password",
              hintText: "Enter your password",
              controller: passwordController,
              obscureText: true,
              screenWidth: screenWidth,
            ),
            SizedBox(height: screenHeight * 0.07),
            SizedBox(
              height: screenHeight * 0.08,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff5DCCFC),
                  overlayColor: Colors.white.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: goToHomePage,
                child: Text(
                  "CREATE AN ACCOUNT",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: screenWidth * 0.042,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: GoogleFonts.poppins(
                    color: const Color(0xff625D5D),
                    fontSize: screenWidth * 0.038,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  style:
                      TextButton.styleFrom(overlayColor: Colors.transparent),
                  onPressed: goToSigninPage,
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.poppins(
                      color: const Color(0xff5DCCFC),
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget textfield({
    required String label,
    required String hintText,
    required TextInputType keyboardType,
    required bool obscureText,
    required TextEditingController controller,
    required double screenWidth,
    VoidCallback? onForgotPassword,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            color: const Color(0xff625D5D),
            fontSize: screenWidth * 0.038,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          cursorColor: const Color(0xff5DCCFC),
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: GoogleFonts.poppins(fontSize: screenWidth * 0.038),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey[600],
              fontSize: screenWidth * 0.035,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenWidth * 0.04,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff000000)),
              borderRadius: BorderRadius.zero,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff000000)),
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
      ],
    );
  }
}
