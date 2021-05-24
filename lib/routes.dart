import './screens/screens.dart';

final routeList = {
  '/': (ctx) => SplashScreen(),
  HomeScreenStack.routeName: (ctx) => HomeScreenStack(),
  LoginScreen.routeName: (ctx) => LoginScreen(),
  ParticipantCountryScreen.routeName: (ctx) => ParticipantCountryScreen(),
  RegisterScreen.routeName: (ctx) => RegisterScreen(),
};
