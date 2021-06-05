import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flow/features/register/models/register.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterNamePageState(name: ''));

  Register _register = Register.empty();

  Register get register => _register;

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterNextPage) {
      yield _nextPage();
    }

    if (event is RegisterPreviousPage) {
      yield _previousPage();
    }

    if (event is RegisterUpdate) {
      _updateRegister(event);
    }

    if (event is RegisterCompleteFlow) {
      yield _completeFlow();
    }
  }

  void complete() {
    this.add(RegisterCompleteFlow());
  }
  
  RegisterState _completeFlow() {
    return RegisterCompletedFlow();
  }

  void updateRegister({
    String name,
    String email,
    String password,
  }) {
    this.add(RegisterUpdate(email: email, name: name, password: password));
  }

  _updateRegister(RegisterUpdate event) {
    _register = _register.copyWith(
        email: event.email, name: event.name, password: event.password);
  }

  void nextPage() {
    this.add(RegisterNextPage());
  }

  RegisterState _nextPage() {
    var nextState;
    switch (state.runtimeType) {
      case RegisterNamePageState:
        nextState = RegisterEmailPageState(email: _register.email);
        break;
      case RegisterEmailPageState:
        nextState = RegisterPasswordPageState();
    }
    return nextState;
  }

  void previousPage() {
    this.add(RegisterPreviousPage());
  }

  RegisterState _previousPage() {
    var previousState;
    switch (state.runtimeType) {
      case RegisterPasswordPageState:
        previousState = RegisterEmailPageState(email: _register.email);
        break;
      case RegisterEmailPageState:
        previousState = RegisterNamePageState(name: _register.name);
    }
    return previousState;
  }
}
