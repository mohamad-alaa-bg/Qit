import 'package:fluro/fluro.dart';
import 'package:qit/src/features/home/presentation/pages/home.dart';
import 'package:qit/src/features/login/presentation/pages/login.dart';

class FluroRouterHelper {
  static final router = FluroRouter();
  static final Handler _loginHandler = Handler(
    handlerFunc: (context, parameters) => const Login(),);
  static final Handler _homeHandler = Handler(
    handlerFunc: (context, parameters) => const HomeScreen(),);

  static void configureRoutes() {
    router.define('Login', handler: _loginHandler);
    router.define('HomeScreen', handler: _homeHandler);
  }
}