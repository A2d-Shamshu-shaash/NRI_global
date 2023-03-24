import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nri_global/views/Authentication/signin/forgotpassword.dart';
import 'package:nri_global/views/Authentication/signup/SignUpScreen.dart';

import '../../../globals/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool _isButtonDisabled = true;
  bool isVisible = false;

  void _checkIfButtonEnabled() {
    if (emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
      setState(() {
        _isButtonDisabled = false;
      });
    } else {
      setState(() {
        _isButtonDisabled = true;
      });
    }

    print(_isButtonDisabled);
  }

  @override
  void initState() {
    super.initState();
    emailcontroller.addListener(() {
      _checkIfButtonEnabled();
    });
    passwordcontroller.addListener(() {
      _checkIfButtonEnabled();
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back,color: Colors.black,)),
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Login to Global NRI",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: TextFormField(
                
                controller: emailcontroller,
                onChanged: (value) {
                  setState(() {});
                },
                decoration:  InputDecoration(
                  // label: Text("Email"),
                   contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                     suffixIcon: SvgPicture.asset('assets/images/user.svg',
                      height: 15, width: 15, fit: BoxFit.scaleDown),
                    hintText: 'Email *',
                    labelText: "Email *",
                    labelStyle: TextStyle(color: texSecondaryColor),
                     hintStyle: GoogleFonts.sora(color: texSecondaryColor,fontSize: 14),
                    filled: true,
                    border: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                obscureText: isVisible,
                
                controller: passwordcontroller,
                onChanged: (value) {
                  setState(() {});
                },
                decoration:  InputDecoration(
                   contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                   labelText: "Password *",
                   labelStyle: TextStyle(color: texSecondaryColor),
                    hintStyle: GoogleFonts.sora(color: texSecondaryColor,fontSize: 14),
                     suffixIcon: SvgPicture.asset('assets/images/eye-slash.svg',
                      height: 15, width: 15, fit: BoxFit.scaleDown),
                    // suffixIcon: IconButton(onPressed: (){
                    //   isVisible=!isVisible;
                    //   setState(() {
                        
                    //   });

                    // }, icon: Icon(isVisible? Icons.visibility:Icons.visibility_off)),
                    hintText: 'Password *',
                    filled: true,
                    border: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(ForgotPassword()),
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.sora(color: texSecondaryColor,fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ElevatedButton(
                  onPressed: _isButtonDisabled
                      ? null
                      : () {
                         
                        },
                  style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: disableColor,
                      backgroundColor:
                          _isButtonDisabled ? disableColor : primaryColour,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(58))),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: Text(
                "OR LOGIN WITH",
                style: GoogleFonts.sora(color: texSecondaryColor,fontSize: 14),
              ),
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/google.svg"),
                SizedBox(
                  width: 10,
                ),
                SvgPicture.asset("assets/images/twitter.svg"),
                SizedBox(
                  width: 10,
                ),
                SvgPicture.asset("assets/images/facebook.svg"),
              ],
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  "Don't have an account?",
                  style: GoogleFonts.sora(color: texSecondaryColor,fontSize: 14),
                ),
                GestureDetector(
                  onTap: () => Get.to(SignUpForm()),
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.sora(
                        color: primaryColour, fontWeight: FontWeight.bold,fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}