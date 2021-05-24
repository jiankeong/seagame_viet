import './screens/screens.dart';

final routeList = {
  '/': (ctx) => SplashScreen(),
  HomeScreenStack.routeName: (ctx) => HomeScreenStack(),
  LoginScreen.routeName: (ctx) => LoginScreen(),
};
