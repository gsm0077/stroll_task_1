import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stroll/gen/assets.gen.dart';
import 'package:stroll/routes/routes_list.dart';

class HorizontalCardList extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      'title': 'Amanda, 20',
      'subtitle': 'What is your favorite time of the day?',
      'image': Assets.jpg.bgChat.path,
    },
    {
      'title': 'Binghan, 24',
      'subtitle': 'Mountain or Ocean?',
      'image': Assets.jpg.bgChat.path,
    },
    {
      'title': 'Binghan, 24',
      'subtitle': 'Mountain or Ocean?',
      'image': Assets.jpg.bgChat.path,
    },
  ];

  HorizontalCardList({super.key});
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: SizedBox(
        height: 210,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];

            return GestureDetector(
              onTap: () {
                context.push(RoutesList.chatStartUi);

                // context.push(RoutesList.singleChatScreen);
              },
              child: Hero(
                tag: "imageScale",
                child: Container(
                  margin: EdgeInsets.only(right: 16, bottom: 10),
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage(item['image']!),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        blurRadius: 5,
                        offset: Offset(0, 1),
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: SvgPicture.asset(
                          Assets.svgs.dashboard.fade,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Bottom aligned content
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Spacer(),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: DashedCircularProgressBar.aspectRatio(
                                    aspectRatio: 1, // width ÷ height
                                    valueNotifier: _valueNotifier,
                                    progress: 22,
                                    maxProgress: 48,
                                    corners: StrokeCap.butt,
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.grey,
                                    foregroundStrokeWidth: 2,
                                    backgroundStrokeWidth: 2,
                                    animation: true,
                                    child: Center(
                                      child: ValueListenableBuilder(
                                        valueListenable: _valueNotifier,
                                        builder: (_, double value, __) => Text(
                                          '${value.toInt()} hr',
                                          style: const TextStyle(
                                              color: Colors.white, fontWeight: FontWeight.normal, fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  item['title']!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  child: Text(
                                    item['subtitle']!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
