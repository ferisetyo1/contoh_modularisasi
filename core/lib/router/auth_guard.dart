import 'package:core/core.dart';

class AuthGuard extends AutoRouteGuard {
  HiveHelper hive = getIt();
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // if (hive.getIsLoggedIn()) {
    // if user is authenticated we continue
    // resolver.next(true);
    // } else {
    // we redirect the user to our login page
    // if (hive.getIsAppFirstTimeLaunch()) {
    //   hive.setIsAppFirstTimeLaunch(false);
    //   // router.push(OnBoardingRoute());
    // } else {
    // router.push(const LoginRoute());
    // }
    // }
  }
}
