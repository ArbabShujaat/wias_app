// import 'package:go_router/go_router.dart';


// final GoRouter router = GoRouter(
//   //TODO: Use the below function for redirection to handle consistancy login.

//   // redirect: (context, state) {
//   //   if (isLoggedIn) {
//   //     return '/language';
//   //   } else {
//   //     return '/HomeScreen';
//   //   }
//   // },

//   errorBuilder: (context, state) =>
//       ErrorPage(), //TODO: Use this for error handling.

//   routes: [
//     GoRoute(
//       name: RouteName.SplashScreen,
//       path: '/',
//       builder: ((context, state) => SplashScreen()),
//     ),
//     GoRoute(
//       name: RouteName.LanguageScreen,
//       path: '/language',
//       builder: ((context, state) => LanguageScreen()),
//     ),
//     GoRoute(
//       name: RouteName.SignInScreen,
//       path: '/signInScreen',
//       builder: ((context, state) => SignInScreen()),
//     ),
//     GoRoute(
//       name: RouteName.SignUpScreen,
//       path: '/signUpScreen',
//       builder: ((context, state) => SignUpScreen()),
//     ),
//     GoRoute(
//       name: RouteName.SignUpWithEmailScreen,
//       path: '/signUpWithEmailScreen',
//       builder: ((context, state) => SignUpWithEmailScreen()),
//     ),
//     GoRoute(
//       name: RouteName.ForgotPasswordScreen,
//       path: '/forgotPasswordScreen',
//       builder: ((context, state) => ForgotPasswordScreen()),
//     ),
//     GoRoute(
//       name: RouteName.MainBottomNavigationScreen,
//       path: '/mainBottomNavigationScreen',
//       builder: ((context, state) => MainBottomNavigationScreen()),
//     ),
//     GoRoute(
//       name: RouteName.CourseDetailScreen,
//       path: '/courseDetailScreen/:index',
//       builder: (context, state) {
//         final id = int.parse(state.pathParameters['index'] ?? '0');

//         // Given that `id` is now an integer, you can proceed safely
//         return CourseDetailScreen(index: id);
//       },
//     ),
//     GoRoute(
//       name: RouteName.CourseContentScreen,
//       path: '/courseContentScreen/:index',
//       builder: ((context, state) {
//         final id = int.parse(state.pathParameters['index'] ?? '0');

//         // Given that `id` is now an integer, you can proceed safely
//         return CourseContentScreen(index: id);
//       }),
//     ),
//     GoRoute(
//       name: RouteName.AllCoursesScreen,
//       path: '/allCoursesScreen',
//       builder: ((context, state) => AllCoursesScreen()),
//     ),
//     GoRoute(
//       name: RouteName.SearchScreen,
//       path: '/searchScreen',
//       builder: ((context, state) => SearchScreen()),
//     ),
//     GoRoute(
//       name: RouteName.EditProfileScreen,
//       path: '/editProfileScreen',
//       builder: ((context, state) => EditProfileScreen()),
//     ),
//   ],
// );
