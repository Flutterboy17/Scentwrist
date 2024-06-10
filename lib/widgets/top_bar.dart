import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required AnimationController animationController,
    required this.scaffoldKey,
    required this.text,
  }) : _animationController = animationController;

  final AnimationController _animationController;
  final GlobalKey<ScaffoldState> scaffoldKey;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: AnimatedIcon(
              color: AppColors.menuColor,
              icon: AnimatedIcons.view_list,
              size: 30,
              progress: _animationController,
            ),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
              _animationController.forward();
            },
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.menuColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Material(
              elevation: 2,
              shape: CircleBorder(),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.mainColor,
                child: Image.asset(
                  AppIcons.search,
                  color: AppColors.primaryColor,
                  height: 22,
                  width: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
