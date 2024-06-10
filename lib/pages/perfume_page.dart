import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../models/perfumes_model.dart';
import '../utils/app_colors.dart';
import '../widgets/drawer.dart';
import '../widgets/top_bar.dart';
import 'watch_page.dart';

class PerfumePage extends StatefulWidget {
  const PerfumePage({super.key});

  @override
  State<PerfumePage> createState() => _PerfumePageState();
}

class _PerfumePageState extends State<PerfumePage>
    with TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _animationController;
  Set<int> likedItems = {};

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 400),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _navigateToWatchPage() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => WatchPage(),
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
        isPerfumePage: true,
        onPerfumeTap: () {},
        onWatchTap: _navigateToWatchPage,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TopBar(
                animationController: _animationController,
                scaffoldKey: scaffoldKey,
                text: "PERFUMES",
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
                    itemCount: perfumes.length,
                    itemBuilder: (context, index) {
                      bool isLiked = likedItems.contains(index);
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
                                        Image.asset(
                                          perfumes[index].image,
                                          fit: BoxFit.cover,
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
                                                  perfumes[index]
                                                      .name
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "${perfumes[index].price} USD",
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
                                            if (likedItems.contains(index)) {
                                              likedItems.remove(index);
                                            } else {
                                              likedItems.add(index);
                                            }
                                          });
                                        },
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          child: Icon(
                                            isLiked
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
}
