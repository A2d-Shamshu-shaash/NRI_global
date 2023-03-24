import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../globals/colors.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back,color: Colors.black,),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Verify Email",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: secondaryColor),),
              ),
              SizedBox(height: 200,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/mail.png",height: 300,),
                ],
              ),
              SizedBox(height: 20,),
              Center(child: Text("Email sent successfully",style: GoogleFonts.sora(fontSize: 24,fontWeight: FontWeight.w600,),)),
              SizedBox(height: 10,),
              Center(child: Text("Check your email to verify and start \nenjoying Global NRI services. Please make\n sure to check your Inbox and Spam Folder.",style: GoogleFonts.sora(fontSize: 16,color: texSecondaryColor,),textAlign: TextAlign.center,)),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    "Don't recieve the link?",
                    style: GoogleFonts.sora(color: Colors.grey,fontSize: 14),
                  ),
                  Text(
                    "Resent link",
                    style: GoogleFonts.sora(
                      fontSize: 14,
                        color: primaryColour, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

    
            ],
          ),
        ),
      ),
    );
  }
}