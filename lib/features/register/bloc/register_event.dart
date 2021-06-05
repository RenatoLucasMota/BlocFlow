part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUpdate extends RegisterEvent {
  final String name;
  final String email;
  final String password;

  RegisterUpdate({this.name, this.email, this.password});
}

class RegisterNextPage extends RegisterEvent {}

class RegisterPreviousPage extends RegisterEvent {}

class RegisterCompleteFlow extends RegisterEvent {}