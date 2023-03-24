import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../globals/colors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController petnamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController Reenterpasswordcontroller = TextEditingController();
  bool _isButtonDisabled = true;
  bool obscureText = true;
  bool obscureText2 = true;


  void _checkIfButtonEnabled() {
    if (petnamecontroller.text.isNotEmpty &&
        passwordcontroller.text.isNotEmpty &&
        Reenterpasswordcontroller.text.isNotEmpty) {
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
    petnamecontroller.addListener(() {
      _checkIfButtonEnabled();
    });
    passwordcontroller.addListener(() {
      _checkIfButtonEnabled();
    });
    Reenterpasswordcontroller.addListener(() {
      _checkIfButtonEnabled();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: ()=>Navigator.of(context).pop(), icon: Icon(Icons.arrow_back,color: Color(0xff292D32),)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
              child: Text(
                "Reset Password",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: secondaryColor),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
              child: Text(
                "To reset password answer security question\n first",
                style: GoogleFonts.sora(color: texSecondaryColor),
              ),
            ),
            SizedBox(height: 10,),
            
            TextFormField(

              controller: petnamecontroller,
              onChanged: (value) {
                setState(() {});
              },
              decoration:  InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
                label: Text("Your pet name*"),
                labelStyle: TextStyle(color: texSecondaryColor),
                 suffixIcon: SvgPicture.asset('assets/images/message-question.svg',
                      height: 15, width: 15, fit: BoxFit.scaleDown),
                  hintText: 'Your pet name*',
                  hintStyle: TextStyle(color: texSecondaryColor),
                  filled: true,
                  border: InputBorder.none),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: passwordcontroller,
              obscureText: obscureText,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                label: Text("Password *"),
                labelStyle: TextStyle(color: texSecondaryColor),
                contentPadding: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
                suffixIcon: SvgPicture.asset('assets/images/eye-slash.svg',
                      height: 15, width: 15, fit: BoxFit.scaleDown),
                  // suffixIcon: IconButton(
                  //     onPressed: () {
                  //       setState(() {
                  //         obscureText = !obscureText;
                  //       });
                  //     },
                  //     icon: obscureText
                  //         ? Icon(Icons.visibility_off)
                  //         : Icon(Icons.visibility)),
                  // Icon(Icons.remove_red_eye_outlined),
                  hintText: 'Password *',
                  hintStyle: TextStyle(color: texSecondaryColor),
                  filled: true,
                  border: InputBorder.none),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: Reenterpasswordcontroller,
              obscureText: obscureText2,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                label: Text("Re-Enter Password *"),
                labelStyle: TextStyle(color: texSecondaryColor),
                contentPadding: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
                  suffixIcon: SvgPicture.asset('assets/images/eye-slash.svg',
                      height: 15, width: 15, fit: BoxFit.scaleDown),
                  // Icon(Icons.remove_red_eye_outlined),
                  hintText: 'Re - Enter Password *',
                  hintStyle: TextStyle(color: texSecondaryColor),
                  filled: true,
                  border: InputBorder.none),
            ),
            SizedBox(height: 32,),
            Center(
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
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
                          borderRadius: BorderRadius.circular(56))),
                  child: const Text(
                    "Reset",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}