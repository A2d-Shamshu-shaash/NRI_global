import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nri_global/globals/colors.dart';
import 'package:nri_global/views/Authentication/signin/signin.dart';

var result;

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var security = "Sequrity Question";
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phonenumbercontroller = TextEditingController();
  final securityController = TextEditingController();

  bool _isButtonDisabled = true;
  bool isDialogButtonEnabled = false;
  String _textFieldValue = '';

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkIfButtonEnabled);
    _usernameController.addListener(_checkIfButtonEnabled);
    _passwordController.addListener(_checkIfButtonEnabled);
    _confirmPasswordController.addListener(_checkIfButtonEnabled);
    _phonenumbercontroller.addListener(_checkIfButtonEnabled);
    securityController.addListener(checkIfDialogButtonEnabled);
    securityController.addListener(_checkIfButtonEnabled);
  }

  void checkIfDialogButtonEnabled() {
    if (securityController.text.isNotEmpty &&
        securityController.text.length > 3) {
      setState(() {
        print("came in");
        isDialogButtonEnabled = true;
      });
    } else {
      setState(() {
        isDialogButtonEnabled = false;
      });
    }
  }

  void _checkIfButtonEnabled() {
    if (_emailController.text.isNotEmpty &&
        _phonenumbercontroller.text.isNotEmpty &&
        securityController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _passwordController.text == _confirmPasswordController.text) {
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
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phonenumbercontroller.dispose();
    securityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Signup to Global NRI",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              onChanged: (value) {
                _checkIfButtonEnabled();
                setState(() {});
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                   suffixIcon: SvgPicture.asset('assets/images/profile-circle.svg',
                      height: 15, width: 15, fit: BoxFit.scaleDown),
                  hintText: 'Email *',
                  labelText: "Email *",
                  labelStyle: TextStyle(color: texSecondaryColor),
                  hintStyle:
                      GoogleFonts.sora(color: texSecondaryColor, fontSize: 14),
                  filled: true,
                  border: InputBorder.none),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  suffixIcon: SvgPicture.asset('assets/images/user.svg',
                      height: 15, width: 15, fit: BoxFit.scaleDown),
                  hintText: 'User name *',
                  labelText: "User name *",
                  labelStyle: TextStyle(color: texSecondaryColor),
                  hintStyle:
                      GoogleFonts.sora(color: texSecondaryColor, fontSize: 14),
                  filled: true,
                  border: InputBorder.none),
            ),
            SizedBox(height: 16),

            IntlPhoneField(
              controller: _phonenumbercontroller,
              flagsButtonPadding: EdgeInsets.only(left: 20),
              dropdownIconPosition: IconPosition.trailing,
              dropdownIcon: Icon(Icons.keyboard_arrow_down),
              decoration: InputDecoration(
                  suffixIcon: SvgPicture.asset('assets/images/call-calling.svg',
                      height: 15, width: 15, fit: BoxFit.scaleDown),
                  prefixIcon: Column(
                    children: [Text("")],
                  ),
                  filled: true,
                  hintText: "Phone Number *",
                  labelText: "Phone Number *",
                  labelStyle: TextStyle(color: texSecondaryColor),
                  hintStyle:
                      GoogleFonts.sora(color: texSecondaryColor, fontSize: 12),
                  border: InputBorder.none
                  // border: OutlineInputBorder(
                  //     borderSide: BorderSide(),
                  // ),
                  ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),

            // SizedBox(height: 16),

            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                   suffixIcon: SvgPicture.asset('assets/images/eye-slash.svg',
                      height: 15, width: 15, fit: BoxFit.scaleDown),
                  hintText: 'Password *',
                  labelText: "Password *",
                  labelStyle: TextStyle(color: texSecondaryColor),
                  hintStyle:
                      GoogleFonts.sora(color: texSecondaryColor, fontSize: 14),
                  filled: true,
                  border: InputBorder.none),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _confirmPasswordController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  suffixIcon: SvgPicture.asset('assets/images/eye-slash.svg',
                      height: 15, width: 15, fit: BoxFit.scaleDown),
                  hintText: 'Re-Password *',
                  labelText: "Re-Password *",
                  labelStyle: TextStyle(color: texSecondaryColor),
                  hintStyle:
                      GoogleFonts.sora(color: texSecondaryColor, fontSize: 14),
                  filled: true,
                  border: InputBorder.none),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Make your password strong by including at least 7 characters, 1 Number, 1 uppercase, 1 lowercase and 1 special character.",
                style: GoogleFonts.sora(fontSize: 10, color: secondaryColor),
              ),
            ),

            GestureDetector(
              onTap: () async {
                result = await showDialog(
                    context: context,
                    builder: ((BuildContext context) {
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return AlertDialog(
                            title: Column(
                              children: [
                                Text(
                                  "Add your security question",
                                  style: GoogleFonts.sora(
                                      fontSize: 18,
                                      color: secondaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                TextFormField(
                                  controller: securityController,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      isDialogButtonEnabled = true;
                                      setState(() {});
                                    }

                                    setState(() {
                                      securityController.addListener(
                                          checkIfDialogButtonEnabled);
                                    });
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Type Your Question',
                                      labelText: "Type Your Question",
                                      labelStyle: TextStyle(color: texSecondaryColor),
                                      hintStyle: GoogleFonts.sora(
                                          color: texSecondaryColor,
                                          fontSize: 14),
                                      border: InputBorder.none,
                                      filled: true),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: TextButton(
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: texSecondaryColor),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(
                                            context,
                                          );
                                          print(result);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: ElevatedButton(
                                        child: Text(
                                          'Add',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        onPressed: !isDialogButtonEnabled
                                            ? null
                                            : () {
                                                Navigator.pop(context,
                                                    securityController.text);
                                                result =
                                                    securityController.text;
                                                setState(() {});
                                              },
                                        style: ElevatedButton.styleFrom(
                                            disabledBackgroundColor:
                                                disableColor,
                                            backgroundColor:
                                                !isDialogButtonEnabled
                                                    ? disableColor
                                                    : primaryColour,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14))),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            // actions: [

                            //   TextButton(
                            //     child: Text('Cancel'),
                            //     onPressed: () {
                            //       Navigator.pop(
                            //         context,
                            //       );
                            //       print(result);
                            //     },
                            //   ),
                            //   ElevatedButton(
                            //     child: Text('Add'),
                            //     onPressed: !isDialogButtonEnabled
                            //         ? null
                            //         : () {
                            //             Navigator.pop(
                            //                 context, securityController.text);
                            //             result = securityController.text;
                            //             setState(() {});
                            //           },
                            //     style: ElevatedButton.styleFrom(
                            //         backgroundColor: !isDialogButtonEnabled
                            //             ? disableColor
                            //             : primaryColour,
                            //         shape: RoundedRectangleBorder(
                            //             borderRadius:
                            //                 BorderRadius.circular(14))),
                            //   ),
                            // ],
                          );
                        },
                      );
                    }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.all(8),
                height: 58,
                width: double.infinity,
                color: Colors.grey.shade200,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14,right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(security,
                              style: GoogleFonts.sora(
                                  fontSize: 14, color: texSecondaryColor)),
                         SizedBox(
                          height: 15,
                          width: 15,
                          child: SvgPicture.asset('assets/images/arrow-down.svg',fit: BoxFit.scaleDown,))
                      // height: 5, width: 5, fit: BoxFit.scaleDown),
                        ],
                      ),
                    ),
                    Text(result ?? "")
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _isButtonDisabled ? null : () {},
                  child: Text(
                    "Sign",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: disableColor,
                      backgroundColor:
                          _isButtonDisabled ? disableColor : primaryColour,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(58))),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Or Sign Up with ",
                  style:
                      GoogleFonts.sora(fontSize: 14, color: texSecondaryColor),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
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
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style:
                      GoogleFonts.sora(fontSize: 14, color: texSecondaryColor),
                ),
                GestureDetector(
                  onTap: () => Get.to(LoginPage()),
                  child: Text(
                    " Log In",
                    style: GoogleFonts.sora(
                        fontWeight: FontWeight.bold,
                        color: primaryColour,
                        fontSize: 14),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
