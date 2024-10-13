import 'package:get/get.dart';
import 'route_path.dart';
import '../../pages/splash_screen/common/splash_bindings.dart';
import '../../pages/splash_screen/views/splash_view.dart';
import '../../pages/forgot_password/common/forgot_bindings.dart';
import '../../pages/forgot_password/views/forgot_view.dart';
import '../../pages/accounts/common/accounts_bindings.dart';
import '../../pages/accounts/views/accounts_view.dart';
import '../../pages/signup/common/signup_bindings.dart';
import '../../pages/signup/views/signup_view.dart';
import '../../pages/login/common/login_bindings.dart';
import '../../pages/login/views/login_view.dart';
import '../../pages/home/common/home_bindings.dart';
import '../../pages/home/views/home_view.dart';

class RoutePages {
  static List<GetPage> pages = [
    GetPage(
      name: RoutePath.splash,
      page: () => const SplashView(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: RoutePath.home,
      page: () => const HomeView(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RoutePath.login,
      page: () => const LoginView(),
      binding: LoginBindings(),
      children: [
        GetPage(
          name: RoutePath.signup,
          page: () => const SignupView(),
          binding: SignupBindings(),
        ),
        GetPage(
          name: RoutePath.forgot,
          page: () => const ForgotView(),
          binding: ForgotBindings(),
        ),
      ],
    ),
    GetPage(
      name: RoutePath.accounts,
      page: () => const AccountsView(),
      binding: AccountsBindings(),
    ),
  ];
}
