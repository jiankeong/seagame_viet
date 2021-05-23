class Globals {
  static final Globals _globals = Globals._internal();
  static double? _screenHeight;
  static double? _screenWidth;

  factory Globals() {
    return _globals;
  }

  Globals._internal();

  void setScreenSize({
    required double screenHeight,
    required double screenWidth,
  }) {
    _screenHeight = screenHeight;
    _screenWidth = screenWidth;
  }

  double getScreenHeight() {
    return _screenHeight!;
  }

  double getScreenWidth() {
    return _screenWidth!;
  }
}
