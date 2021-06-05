import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flow/features/onboarding/pages/onboarding_page.dart';
import 'package:flutter_flow/features/register/bloc/register_bloc.dart';
import 'package:flutter_flow/features/register/flow/register_flow.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    var newRoute;
    switch (settings.name) {
      case OnBoardingPage.route:
        newRoute = MaterialPageRoute(
          builder: (context) => OnBoardingPage(),
        );
        break;
      case RegisterFlow.route:
        newRoute = MaterialPageRoute(
          builder: (context) => BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(),
            child: RegisterFlow(),
          ),
        );
        break;
    }
    return newRoute;
  }
}
