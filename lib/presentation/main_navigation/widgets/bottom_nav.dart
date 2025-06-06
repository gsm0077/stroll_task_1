import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll/core/constants/app_colors.dart';
import 'package:stroll/gen/assets.gen.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key, required this.currentIndex, required this.onTap});
  int currentIndex;
  Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        backgroundColor: AppColors.bottomDarkColor,
        currentIndex: currentIndex,
        showSelectedLabels: false, // Hide selected label
        showUnselectedLabels: false, // Hide unselected label,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.svgs.bottom.card,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Stack(
                children: [
                  SvgPicture.asset(Assets.svgs.bottom.bonfire),
                  Positioned(
                      right: 0,
                      top: 5,
                      child: Container(
                        margin: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            color: AppColors.baseViolet,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xff0F1115), width: 1.4)),
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        child: Text(
                          '10',
                          style: TextStyle(
                            color: AppColors.baseViolet, // text color
                            fontSize: 7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ],
              ),
              label: "Flames"),
          BottomNavigationBarItem(
              icon: Stack(
                children: [
                  SvgPicture.asset(Assets.svgs.bottom.chat),
                  Positioned(
                      right: 0,
                      top: 5,
                      child: Container(
                        margin: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            color: AppColors.baseViolet,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xff0F1115), width: 1.4)),
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        child: Text(
                          '10',
                          style: TextStyle(
                            color: Color(0xff0F1115), // text color
                            fontSize: 7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ],
              ),
              label: "Chat"),
          BottomNavigationBarItem(icon: SvgPicture.asset(Assets.svgs.bottom.user), label: "Profile"),
        ]);
  }
}
