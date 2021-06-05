import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flow/features/register/bloc/register_bloc.dart';
import 'package:flutter_flow/features/register/pages/register_email_page.dart';
import 'package:flutter_flow/features/register/pages/register_name_page.dart';
import 'package:flutter_flow/features/register/pages/register_password_page.dart';

class RegisterFlow extends StatelessWidget {
  RegisterFlow({Key key}) : super(key: key);

  static const String route = '/register';

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<RegisterBloc>(context);
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterCompletedFlow) {
          Navigator.pop(context, bloc.register);
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        bloc: bloc,
        builder: (context, state) {
          return Navigator(
            pages: pages(bloc, state),
            onPopPage: (route, result) {
              bloc.previousPage();
              return route.didPop(result);
            },
          );
        },
      ),
    );
  }

  List<Page<dynamic>> pages(RegisterBloc bloc, RegisterState state) {
    final list = <Page<dynamic>>[];
    final namePage = RegisterNamePage.page(name: bloc.register.name);
    final emailPage = RegisterEmailPage.page(email: bloc.register.email);
    final passwordPage = RegisterPasswordPage.page();
    if (state is RegisterNamePageState) {
      list.add(namePage);
    }
    if (state is RegisterEmailPageState) {
      list.addAll([namePage, emailPage]);
    }
    if (state is RegisterPasswordPageState) {
      list.addAll([namePage, emailPage, passwordPage]);
    }
    return list;
  }
}
