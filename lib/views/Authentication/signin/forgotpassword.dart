import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nri_global/views/Authentication/signin/resetPassword.dart';
import 'package:nri_global/views/Authentication/signin/signin.dart';
import 'package:nri_global/views/Authentication/signup/SignUpScreen.dart';

import '../../../globals/colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController emailController;
  bool _isButtonDisabled = true;


  void changeButtonStatus(){
    if (emailController.text.length>2) {
      setState(() {
        _isButtonDisabled=!_isButtonDisabled;
      });
      
    }else if(emailController.text.isEmpty){
      setState(() {
        _isButtonDisabled=!_isButtonDisabled;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    emailController.addListener(changeButtonStatus);
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
                "Forgot Password?",
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  "Enter your registed email below to receive password reset instructions",style: GoogleFonts.sora(color: texSecondaryColor,fontSize: 14),),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                 suffixIcon: SvgPicture.asset('assets/images/user.svg',
                      height: 15, width: 15, fit: BoxFit.scaleDown),
                  hintText: 'Email *',
                  labelText: "Email *",
                  labelStyle: TextStyle(color: texSecondaryColor),
                  hintStyle: GoogleFonts.sora(color: texSecondaryColor,fontSize: 12),
                  filled: true,
                  border: InputBorder.none),
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isButtonDisabled
                      ? null
                      : () {
                          Get.to(ResetPassword());
                        },
                  child: Text("Submit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: disableColor,
                      backgroundColor:
                          _isButtonDisabled ? disableColor : primaryColour,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(56))),
                ),
              ),
            ),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  "Remember Password?",
                  style: GoogleFonts.sora(color:texSecondaryColor,fontSize: 14,),
                ),
                GestureDetector(
                  onTap: () => Get.to(LoginPage()),
                  child: Text(
                    "Login",
                    style: GoogleFonts.sora(
                        color: primaryColour, fontWeight: FontWeight.bold,fontSize: 14),
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  "Don't have an account?",
                  style: GoogleFonts.sora(color:texSecondaryColor,fontSize: 14),
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
            SizedBox(height: 15,)

          ],
        ),
      ),
    );
  }
}
