import 'package:flutter/material.dart';
import 'package:stroll/gen/assets.gen.dart';

Color myColor = const Color(0xFF121518).withOpacity(0.9); // 90%

class FlamesIconTest extends StatelessWidget {
  const FlamesIconTest({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 139,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            top: 6,
            left: 32,
            child: Container(
              // height: 20,
              decoration: BoxDecoration(
                color: myColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.fromLTRB(32, 4, 8, 4),
              child: Text(
                'Angelina, 28',
                style: TextStyle(color: Color(0xffF5F5F5), fontWeight: FontWeight.bold, fontSize: 11),
                softWrap: true,
              ),
            ),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                width: 5,
                color: Color(0xff0D0F11),
              ),
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: AssetImage(Assets.pngs.joey.path),
                // fit: BoxFit.fill, // Or use BoxFit.contain/cover/fill
              ),
            ),
          ),
        ],
      ),
    );
  }
}
