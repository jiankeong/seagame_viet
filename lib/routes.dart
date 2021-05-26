import './screens/screens.dart';

final routeList = {
  '/': (ctx) => SplashScreen(),
  HomeScreenStack.routeName: (ctx) => HomeScreenStack(),
  LoginScreen.routeName: (ctx) => LoginScreen(),
  ParticipantCountryScreen.routeName: (ctx) => ParticipantCountryScreen(),
  RegisterScreen.routeName: (ctx) => RegisterScreen(),
  ChangePasswordScreen.routeName: (ctx) => ChangePasswordScreen(),
  HelpdeskScreen.routeName: (ctx) => HelpdeskScreen(),
  MyTicketsScreen.routeName: (ctx) => MyTicketsScreen(),
  EShopScreen.routeName: (ctx) => EShopScreen(),
  ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
  SocialScreen.routeName: (ctx) => SocialScreen(),
  GamesScreen.routeName: (ctx) => GamesScreen(),
  GalleryMenuScreen.routeName: (ctx) => GalleryMenuScreen(),
  GamesDetailScreen.routeName: (ctx) => GamesDetailScreen(),
  GalleryDetailScreen.routeName: (ctx) => GalleryDetailScreen(),
  NewsMenuScreen.routeName: (ctx) => NewsMenuScreen(),
};
