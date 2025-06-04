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
          BottomNavigationBarItem(icon: SvgPicture.asset(Assets.svgs.bottom.bonfire), label: "Flames"),
          BottomNavigationBarItem(icon: SvgPicture.asset(Assets.svgs.bottom.chat), label: "Chat"),
          BottomNavigationBarItem(icon: SvgPicture.asset(Assets.svgs.bottom.user), label: "Profile"),
        ]);
  }
}
