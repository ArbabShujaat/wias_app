import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Constants/Assets.dart';
import 'package:wias/Core/Providers/BottomNavBarProvider.dart';
import 'package:wias/UI/CustomWidgets/GlobalAppBackgroundWidget.dart';
import 'package:wias/UI/Screens/AddNewUserScreen/AddNewUserScreen.dart';
import 'package:wias/UI/Screens/AddOrEditQuestionsScreen/AddOrEditQuestionsScreen.dart';
import 'package:wias/UI/Screens/MessageScreen/MessageScreen.dart';
import 'package:wias/UI/Screens/AddedByScreen/AddedByScreen.dart';
import 'package:wias/UI/Screens/HomeScreen/HomeScreen.dart';
import 'package:wias/UI/Screens/MainBottomNavigationScreen/widgets/BottomNavWidget.dart';
import 'package:wias/UI/Screens/SettingsScreen/SettingsScreen.dart';
import 'package:wias/UI/Screens/WriteANewMessageScreen.dart/CreateAndWrtieAMessageScreen.dart';

class MainBottomNavigationScreen extends StatefulWidget {
  @override
  State<MainBottomNavigationScreen> createState() =>
      _MainBottomNavigationScreenState();
}

class _MainBottomNavigationScreenState extends State<MainBottomNavigationScreen>
    with SingleTickerProviderStateMixin {
  bool isMenuOpen = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    if (isMenuOpen) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() {});
    isMenuOpen = !isMenuOpen;
    print(isMenuOpen);
  }

  List<Widget> screens = [
    HomeScreen(),
    AddedByScreen(),
    ChatScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavWidget(size: size),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: _toggleMenu,
        child: Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: Image.asset(
            floatingActionButtonIcon,
            width: 65.w,
            height: 65.w,
          ),
        ),
      ),
      body: GlobalAppBackgroundWidget(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              screens[Provider.of<BottomNavProvider>(context).bottomNavIndex],
              Visibility(
                visible: isMenuOpen,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _animationController.value,
                      child: SafeArea(
                        left: false,
                        right: false,
                        top: false,
                        child: SizedBox(
                          width: 180.w,
                          height: 110.h,
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    _toggleMenu();
                                    Get.to(
                                      () => CreateAndWrtieAMessageScreen(),
                                    );
                                  },
                                  child: Image.asset(
                                    newMessageFABIcon,
                                    width: 55.w,
                                    height: 55.w,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    _toggleMenu();
                                    Get.to(() => AddNewUserScreen());
                                  },
                                  child: Image.asset(
                                    addNewMemberFABIcon,
                                    width: 55.w,
                                    height: 55.w,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  behavior: HitTestBehavior.deferToChild,
                                  onTap: () {
                                    _toggleMenu();
                                    Get.to(() => AddOrEditQuestionsScreen());
                                  },
                                  child: Image.asset(
                                    helpFABIcon,
                                    width: 55.w,
                                    height: 55.w,
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}

//Floating Action Menu Button Animation Widget

