import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './providers/auth_provider.dart';
import './routes.dart' as routes;
import './utils/shared_prefs.dart';
import './utils/secure_storage.dart';
import './utils/play_service_checking_utils.dart';
import './styles.dart';
import './providers/route_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs()
      .init()
      .then((value) => PlayServiceCheckingUtils().isHuaweiChecking());
  SecureStorage().init();
  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
        ChangeNotifierProvider.value(
          value: RouteProvider(),
        ),
      ],
      child: EasyLocalization(
        useOnlyLangCode: true,
        supportedLocales: [
          Locale('en'),
          Locale('zh'),
          Locale('vi'),
        ],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isInit = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        title: 'Sea Games GMS',
        theme: ThemeData(
          fontFamily: 'RobotoCondensed',
          primaryColor: Styles.primaryColor,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Styles.primaryDarkColor,
          ),
        ),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: '/',
        routes: routes.routeList,
      ),
    );
  }
}
