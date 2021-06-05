import 'package:flutter/material.dart';
import 'package:flutter_flow/features/register/flow/register_flow.dart';
import 'package:flutter_flow/features/register/models/register.dart';

class OnBoardingPage extends StatefulWidget {
  OnBoardingPage({Key key}) : super(key: key);
  static const String route = '/';

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  var _register = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Center(child: Text(_register))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Entrar'),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 48,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () async {
                      var register =
                          await Navigator.pushNamed(context, RegisterFlow.route);
                      if (register is Register) {
                        setState(() {
                          _register = register.toString();
                        });
                      }
                    },
                    child: Text('Registrar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
