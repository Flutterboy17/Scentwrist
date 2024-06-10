import 'package:flutter/material.dart';
import 'package:scentwrist/utils/app_colors.dart';

class CustomDrawer extends StatefulWidget {
  final AnimationController animationController;
  final bool isPerfumePage;
  final Function onPerfumeTap;
  final Function onWatchTap;

  const CustomDrawer({
    Key? key,
    required this.animationController,
    required this.isPerfumePage,
    required this.onPerfumeTap,
    required this.onWatchTap,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _perfumeClicked = false;
  bool _watchClicked = false;

  void _handlePerfumeTap() {
    if (!widget.isPerfumePage) {
      setState(() {
        _perfumeClicked = true;
        _watchClicked = false;
      });
      widget.onPerfumeTap();
    }
  }

  void _handleWatchTap() {
    if (widget.isPerfumePage) {
      setState(() {
        _watchClicked = true;
        _perfumeClicked = false;
      });
      widget.onWatchTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      backgroundColor: AppColors.mainColor,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24, left: 8),
                child: IconButton(
                  icon: AnimatedIcon(
                    size: 30,
                    color:  AppColors.primaryColor,
                    icon: AnimatedIcons.menu_close,
                    progress: widget.animationController,
                  ),
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                    widget.animationController.reverse();
                  },
                ),
              ),
              Spacer(),
              Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.remove,
                      color:AppColors.primaryColor,
                    ),
                    title: GestureDetector(
                      onTap: _handleWatchTap,
                      child: Text(
                        "WRIST WATCH",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.normal,
                          color: AppColors.primaryColor,
                          decoration: _watchClicked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationColor: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  ListTile(
                    leading: Icon(
                      Icons.remove,
                      color: AppColors.primaryColor,
                    ),
                    title: Text(
                      "LEATHER PURSE",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.remove,
                      color: AppColors.primaryColor,
                    ),
                    title: GestureDetector(
                      onTap: _handlePerfumeTap,
                      child: Text(
                        "DUBAI PERFUME",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.normal,
                          color: AppColors.primaryColor,
                          decoration: _perfumeClicked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationColor: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  ListTile(
                    leading: Icon(
                      Icons.remove,
                      color: AppColors.primaryColor,
                    ),
                    title: Text(
                      "SKIN CARE",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  ListTile(
                    leading: Icon(
                      Icons.remove,
                      color: AppColors.primaryColor,
                    ),
                    title: Text(
                      "GOLD JEWELLERY",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
