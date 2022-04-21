import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qit/src/core/resources/themes.dart';
import 'package:qit/src/core/services/remote_services/dio_helper.dart';
import 'package:qit/src/core/utiles/router.dart';
import 'package:qit/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:qit/src/features/login/presentation/bloc/auth_bloc.dart';
import 'package:qit/src/features/login/presentation/pages/login.dart';
import 'package:qit/src/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FluroRouterHelper.configureRoutes();
  await init();
  await DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => sl(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qit',
        theme: lightTheme,
        initialRoute: 'Login',
        onGenerateRoute: FluroRouterHelper.router.generator,
        home: const Login(),
      ),
    );
  }
}
