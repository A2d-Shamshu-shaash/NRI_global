import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:nri_global/globals/colors.dart';
import 'package:nri_global/views/Authentication/signin/signin.dart';
import 'package:nri_global/views/Authentication/signup/SignUpScreen.dart';
import 'package:story_page_view/story_page_view.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';


int currentPage = 0;

class OnboardScreen extends StatefulWidget {
  OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  Color fallBackColor = Color(0xffffffff);
  final controller = StoryController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var weight = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: PageView.builder(
          
                  onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
          return Container(
            color: index == 0
                ? onbaordingColorOne
                : index == 1
                    ? onbaordingColorTwo
                    : onbaordingColorThree,
            // margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32,
                ),
                // StoryView(
                //   storyItems: [
                //     StoryItem(
                //       Text("hgjvygh")
                //       , duration: Duration(seconds: 3))
        
                //   ],
                //    controller: controller),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/logo.svg",
                        height: 22,
                      ),
                      SizedBox(
                          height: 19,
                          child: Center(
                              child: Text(" Welcome to Global NRI",
                                  style: GoogleFonts.sora(fontSize: 12))))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Ride in Style,arrive in \nConfidence-book your\ncar today!",
                        style: TextStyle(
                            fontSize: 28,
                            color: secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  width: 10,
                ),
                Center(
                  child: Container(
                    height: height * 0.4,
                    width: weight * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)),
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(LoginPage());
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColour,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: OutlinedButton(
                      onPressed: () {
                        Get.to(SignUpForm());
                      },
                      child: const Text("Sign up",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20));
                          }
                          return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20));
                        }),
                        side: MaterialStateProperty.resolveWith((states) {
                          // Change the outline color based on the button's state
                          if (states.contains(MaterialState.pressed)) {
                            return BorderSide(color: Colors.red, width: 2);
                          }
                          return BorderSide(color: primaryColour, width: 1);
                        }),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Continue as Guest",
                      style: TextStyle(
                          fontSize: 16,
                          color: primaryColour,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          );
                  },
                ),
        )
        );
  }
}

Container buildDot({required int index, required BuildContext context}) {
  var weight = MediaQuery.of(context).size.width;
  return Container(
    margin: EdgeInsets.only(right: 5),
    height: 6,
    width: weight * 0.289,
    decoration: BoxDecoration(
        color: currentPage == index ? primaryColour : Colors.white,
        borderRadius: BorderRadius.circular(12)),
  );
}

class StoryScreen extends StatelessWidget {
   StoryScreen({super.key});
  // final controller = StoryController();
  final controller = StoryPageController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: StoryPageView(
        
        controller: controller,
        indicatorPosition: StoryPageIndicatorPosition.overlay(),
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.red,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.green,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.amber,
          ),

        ],
      )
    );
  }
}



