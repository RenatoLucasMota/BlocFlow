import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flow/features/register/bloc/register_bloc.dart';

class RegisterNamePage extends StatelessWidget {
  const RegisterNamePage({Key key, @required this.name}) : super(key: key);
  final String name;

  static Page<dynamic> page({@required String name}) =>
      MaterialPage(child: RegisterNamePage(name: name));

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.chevron_right),
          onPressed: () {
            bloc.nextPage();
          }),
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Center(
          child: TextField(
            onChanged: (name) => bloc.updateRegister(name: name),
            controller: TextEditingController(text: name),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'Nome'),
          ),
        ),
      ),
    );
  }
}
