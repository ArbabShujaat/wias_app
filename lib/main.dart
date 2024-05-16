import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:wias/Core/Providers/BottomNavBarProvider.dart';
import 'package:wias/UI/Screens/AddNewUserScreen/AddNewUserViewModel.dart';
import 'package:wias/UI/Screens/AuthScreens/FotgotPassword/ForgotPasswordViewModel.dart';
import 'package:wias/UI/Screens/AuthScreens/LoginScreen/LoginViewModel.dart';
import 'package:wias/UI/Screens/AuthScreens/SignUpScreen/SignUpViewModel.dart';
import 'package:wias/UI/Screens/HomeScreen/HomeViewModel.dart';
import 'package:wias/UI/Screens/OnBoardingScreen/OnBordindViewModel.dart';
import 'package:wias/UI/Screens/PersonDetailsScreen/PersonDetailViewModel.dart';
import 'package:wias/UI/Screens/ProfileScreen/ProfileViewModel.dart';
import 'package:wias/UI/Screens/QuestionsScreens/StartQuestionsViewModel.dart';
import 'package:wias/UI/Screens/SplashScreen/SplashScreen.dart';
import 'package:wias/UI/Screens/SplashScreen/SplashScreenViewModel.dart';
import 'package:wias/UI/Screens/SubscriptionScreens/SubscriptionViewModel.dart';
import 'package:wias/UI/Screens/WriteANewMessageScreen.dart/CreateAndWriteAMessage.dart';
import 'package:wias/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ChangeNotifierProvider(create: (_) => SignUpViewModel()),
      ChangeNotifierProvider(create: (_) => SplashViewModel()),
      ChangeNotifierProvider(create: (_) => OnBoardingViewModel()),
      ChangeNotifierProvider(create: (_) => LogInViewModel()),
      ChangeNotifierProvider(create: (_) => ForgetPasswordViewModel()),
      ChangeNotifierProvider(create: (_) => SubscriptionViewModel()),
      ChangeNotifierProvider(create: (_) => StartQuestionsModel()),
      ChangeNotifierProvider(create: (_) => CreateNewMessageViewMoedl()),
      ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ChangeNotifierProvider(create: (_) => AddNewUserModel()),
          ChangeNotifierProvider(create: (_) => ProfileViewModel()),
                ChangeNotifierProvider(create: (_) => PersonDetailsModel()),
    ],
    child: WIAS(),
  ));
}

class WIAS extends StatelessWidget {
  static const double _designWidth = 430;
  static const double _designHeight = 932;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(_designWidth, _designHeight),
      builder: (context, widget) => GetMaterialApp(
        defaultTransition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 300),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
