import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:stroll/core/constants/app_colors.dart';
import 'package:stroll/presentation/main_navigation/widgets/chats_list_view.dart';
import 'package:stroll/presentation/main_navigation/widgets/hori_card_list.dart';
import 'package:stroll/presentation/main_navigation/widgets/status_chats_list.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int tabTextIndexSelected = 0;
  double defaultStackposition = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: FlutterToggleTab(
                  width: 42, // width in percent
                  borderRadius: 30,
                  height: 25,
                  selectedIndex: tabTextIndexSelected,
                  selectedBackgroundColors: [Colors.grey],
                  unSelectedBackgroundColors: [Colors.transparent],
                  selectedTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                  unSelectedTextStyle: TextStyle(color: Colors.grey[600], fontSize: 14, fontWeight: FontWeight.w500),
                  dataTabs: [
                    DataTab(
                      title: "Matches",
                    ),
                    DataTab(
                        title: "Likes",
                        counterWidget: CircleAvatar(
                          radius: 15, // size of the circle
                          backgroundColor: AppColors.baseViolet, // background color
                          child: Text(
                            '4',
                            style: TextStyle(
                              color: Colors.white, // text color
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                  ],
                  selectedLabelIndex: (index) {
                    setState(() {
                      tabTextIndexSelected = index;
                    });
                  },
                  isScroll: false,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Locked',
                    style: TextStyle(color: Color(0xffF5F5F5), fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Make your move, they are waiting..",
                        softWrap: true,
                        style: TextStyle(fontSize: 14, color: Color(0xffC4C4C4)),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 12, // size of the circle
                            backgroundColor: AppColors.baseViolet,
                          ),
                          Positioned(
                            right: defaultStackposition,
                            child: CircleAvatar(
                                radius: 12, // size of the circle
                                backgroundColor: Colors.red),
                          ),
                          Positioned(
                            right: defaultStackposition + 3,
                            child: CircleAvatar(
                              radius: 12, // size of the circle
                              backgroundColor: Colors.amber,
                            ),
                          ),
                          Positioned(
                            right: defaultStackposition + 9,
                            child: CircleAvatar(
                              radius: 12, // size of the circle
                              backgroundColor: Colors.blue,
                            ),
                          ),
                          Positioned(
                            right: defaultStackposition + 9,
                            child: CircleAvatar(
                              radius: 12, // size of the circle
                              backgroundColor: Colors.grey[800],
                              child: Text(
                                "+5",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  HorizontalCardList(),
                  StatusChatsList(),
                  ChatsListView()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
