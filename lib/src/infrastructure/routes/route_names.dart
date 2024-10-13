import 'route_path.dart';

class RouteNames {
  static const String home = RoutePath.home;
  static const String login = RoutePath.login;
  static const String signup = '${RoutePath.login}${RoutePath.signup}';
  static const String accounts = RoutePath.accounts;
  static const String forgot = '${RoutePath.login}${RoutePath.forgot}';
  static const String splash = RoutePath.splash;
}
