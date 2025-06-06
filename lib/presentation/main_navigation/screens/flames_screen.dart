import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll/core/constants/app_colors.dart';
import 'package:stroll/gen/assets.gen.dart';
import 'package:stroll/gen/fonts.gen.dart';
import 'package:stroll/presentation/main_navigation/widgets/flames_icon_test.dart';

class FlamesScreen extends StatefulWidget {
  const FlamesScreen({super.key});

  @override
  State<FlamesScreen> createState() => _FlamesScreenState();
}

enum TimeOptions { A, B, C, D }

class _FlamesScreenState extends State<FlamesScreen> {
  TimeOptions? timeOptions;

  changeOption(TimeOptions? option) {
    setState(() {
      timeOptions = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.jpg.sunrise.path,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: SvgPicture.asset(
              Assets.svgs.dashboard.fade,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              // Stroke
                              Text(
                                "Stroll Bonfire",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 34,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2
                                    ..color = Color(0xffB3ADF6),
                                ),
                              ),
                              // Fill
                              Text(
                                "Stroll Bonfire",
                                style: TextStyle(
                                  color: Color(0xffCCC8FF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 34,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.expand_more,
                            size: 35,
                            color: Color(0xffCBC9FF),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.svgs.dashboard.clock,
                                width: 13,
                                height: 15,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '22h 00m',
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.svgs.dashboard.user,
                                width: 13,
                                height: 15,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '103',
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(),
                // 121517
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -30,
                      left: 17,
                      child: FlamesIconTest(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Spacer(),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'What is your favorite time of the day?',
                              style: TextStyle(color: Color(0xffF5F5F5), fontWeight: FontWeight.bold, fontSize: 20),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    "“Mine is definitely the peace in the morning.”",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        color: Color(0xffCBC9FF).withOpacity(0.7)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: OptionsButton(
                        selectedOption: timeOptions,
                        changeOption: changeOption,
                        myOption: TimeOptions.A,
                        optionName: "A",
                        description: "The peace in the early mornings",
                      )),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: OptionsButton(
                        selectedOption: timeOptions,
                        changeOption: changeOption,
                        myOption: TimeOptions.B,
                        optionName: "B",
                        description: "The magical golden hours",
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: OptionsButton(
                        selectedOption: timeOptions,
                        changeOption: changeOption,
                        myOption: TimeOptions.C,
                        optionName: "C",
                        description: "Wind-down time after dinners",
                      )),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: OptionsButton(
                        selectedOption: timeOptions,
                        changeOption: changeOption,
                        myOption: TimeOptions.D,
                        optionName: "D",
                        description: "The serenity past midnight",
                      )),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pick your option.',
                              style: TextStyle(color: Colors.white, fontFamily: FontFamily.proximaNova, fontSize: 12)),
                          Text('See who has a similar mind.',
                              style: TextStyle(color: Colors.white, fontFamily: FontFamily.proximaNova, fontSize: 12))
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 48,
                        height: 48,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // Makes the container circular
                          // color: Colors.white, // Background color
                          border: Border.all(
                            color: AppColors.baseViolet, // Border color
                            width: 2.2, // Border width
                          ),
                        ),
                        child: SvgPicture.asset(
                          Assets.svgs.flames.mic,
                          width: 15,
                          height: 26,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.baseViolet,
                          shape: BoxShape.circle, // Makes the container circular
                          // color: Colors.white, // Background color
                          border: Border.all(
                            color: AppColors.baseViolet, // Border color
                            width: 2.2, // Border width
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 30,
                          weight: 700,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OptionsButton extends StatelessWidget {
  OptionsButton(
      {super.key,
      required this.changeOption,
      required this.myOption,
      required this.optionName,
      required this.description,
      this.selectedOption});
  TimeOptions myOption;
  TimeOptions? selectedOption;
  Function(TimeOptions?) changeOption;
  String optionName;
  String description;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          changeOption(myOption);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12), // Internal padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          side: myOption == selectedOption
              ? BorderSide(
                  color: AppColors.baseViolet, // Border color
                  width: 2, // Border width
                )
              : null,
          backgroundColor: Color(0xff232A2E), // Optional background color
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: myOption == selectedOption ? AppColors.baseViolet : null,
                  shape: BoxShape.circle, // Makes the container circular
                  // color: Colors.white, // Background color
                  border: Border.all(
                    color: myOption == selectedOption ? AppColors.baseViolet : Color(0xffF5F5F5), // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Center(
                  child: Text(
                    optionName,
                    style: TextStyle(fontSize: 12, color: Color(0xffF5F5F5)),
                  ),
                ),
              ),
              SizedBox(
                width: 9,
              ),
              Expanded(
                child: Text(
                  description,
                  softWrap: true,
                  style: TextStyle(fontSize: 14, color: Color(0xffC4C4C4)),
                ),
              ),
            ],
          ),
        ));
  }
}
