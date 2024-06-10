import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:scentwrist/pages/perfume_page.dart';
import '../models/watches_model.dart';
import '../utils/app_colors.dart';
import '../widgets/drawer.dart';
import '../widgets/top_bar.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({super.key});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> with TickerProviderStateMixin {
  List<bool> isLikedList = [];

  var scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 400),
    );
    isLikedList = List.generate(watches.length, (index) => false);
    super.initState();
  }

  void _navigateToPerfumePage() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => PerfumePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(
        animationController: _animationController,
        isPerfumePage: false,
        onPerfumeTap: _navigateToPerfumePage,
        onWatchTap: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TopBar(
                animationController: _animationController,
                scaffoldKey: scaffoldKey,
                text: "WATCHES",
              ),
              SizedBox(height: 4),
              Expanded(
                child: AnimationLimiter(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 6,
                    ),
                    itemCount: watches.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredGrid(
                        columnCount: 2,
                        position: index,
                        duration: Duration(milliseconds: 500),
                        child: ScaleAnimation(
                          duration: Duration(milliseconds: 1200),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            watches[index].image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          height: 55,
                                          width: double.infinity,
                                          color: AppColors.bgColor,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, left: 4),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  watches[index]
                                                      .name
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "${watches[index].price} USD",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.mainColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 70,
                                    right: 10,
                                    child: Material(
                                      elevation: 6,
                                      shape: CircleBorder(),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isLikedList[index] =
                                                !isLikedList[index];
                                          });
                                        },
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          child: Icon(
                                            isLikedList[index]
                                                ? CupertinoIcons.heart_fill
                                                : CupertinoIcons.heart,
                                            color: AppColors.mainColor,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
