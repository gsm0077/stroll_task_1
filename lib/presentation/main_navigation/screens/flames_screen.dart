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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            top: -110,
            child: Image.asset(
              Assets.jpg.sunrise.path,
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.123),
                        Colors.transparent,
                      ],
                      stops: [0.0, 0.14, 0.234],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0.0013, -0.6256),
                      radius: 0.75,
                      colors: [
                        Colors.black.withOpacity(0.045),
                        Colors.black.withOpacity(0.107),
                        Colors.black.withOpacity(0.135),
                        Colors.black.withOpacity(0.195),
                        Colors.black.withOpacity(0.24),
                      ],
                      stops: [0.0, 0.6328, 0.7566, 0.8844, 1.0],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color.fromRGBO(13, 14, 18, 0.28),
                          Color.fromRGBO(11, 12, 15, 0.64),
                          Color.fromRGBO(9, 11, 13, 0.8),
                          Colors.black,
                        ],
                        // stops: [0.4397, 0.486, 0.5252, 0.5514, 0.5694],
                        stops: [
                          0.53,
                          0.575,
                          0.615,
                          0.64,
                          0.66
                        ]),
                  ),
                ),
              ],
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
                          SizedBox(
                            height: 40,
                            child: Text(
                              'Stroll Bonfire',
                              style: TextStyle(
                                fontFamily: FontFamily.proximaNova,
                                fontWeight: FontWeight.w700,
                                fontSize: 34,
                                height: 1.0, // line-height 100%
                                letterSpacing: 0.0,
                                color: Color(0xFFCCC8FF),
                                shadows: [
                                  Shadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 7.9,
                                    color: Color(0x33000000),
                                  ),
                                  Shadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 2,
                                    color: Color(0xFFBEBEBE),
                                  ),
                                  Shadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                    color: Color(0x8024232F),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Icon(
                            Icons.expand_more,
                            size: 25,
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
                                color: Color(0xffffffff),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '22h 00m',
                                style: TextStyle(
                                  fontFamily: FontFamily.proximaNova,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  height: 1.0, // line-height: 100%
                                  letterSpacing: 0.0,
                                  color: Colors.white, // #FFFFFF
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 16,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Assets.svgs.dashboard.user,
                                  width: 13,
                                  height: 15,
                                  color: Color(0xffffffff),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '103',
                                  style: TextStyle(
                                    fontFamily: FontFamily.proximaNova,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    height: 1.0, // line-height: 100%
                                    letterSpacing: 0.0,
                                    color: Colors.white, // #FFFFFF
                                  ),
                                ),
                              ],
                            ),
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
                      top: -35,
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
                              style: TextStyle(
                                color: Color(0xffF5F5F5),
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                height: 1.0, // 100% line height
                                fontFamily: FontFamily.proximaNova,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    "“Mine is definitely the peace in the morning.”",
                    softWrap: true,
                    style: TextStyle(
                        fontFamily: FontFamily.proximaNova,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        height: 1.2, // 120% line height
                        letterSpacing: 0,
                        color: Color.fromRGBO(203, 201, 255, 0.7)),
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
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: myOption == selectedOption
              ? BorderSide(
                  color: AppColors.baseViolet,
                  width: 2,
                )
              : null,
          backgroundColor: Color(0xff232A2E),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 2,
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: myOption == selectedOption ? AppColors.baseViolet : null,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: myOption == selectedOption ? AppColors.baseViolet : Color.fromRGBO(196, 196, 196, 1),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    optionName,
                    style: TextStyle(fontSize: 12, color: Color.fromRGBO(196, 196, 196, 1)),
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
                  style: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(196, 196, 196, 1), fontFamily: FontFamily.proximaNova,
                    fontWeight: FontWeight.w400,

                    height: 1.05, // 105% line height
                    letterSpacing: 0,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
