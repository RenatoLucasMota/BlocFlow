part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  
  @override
  List<Object> get props => [];
}

class RegisterNamePageState extends RegisterState {
  final String name;

  RegisterNamePageState({@required this.name});

  @override
  List<Object> get props => [name];
}

class RegisterEmailPageState extends RegisterState {
  final String email;

  RegisterEmailPageState({@required this.email});

  @override
  List<Object> get props => [email];
}

class RegisterPasswordPageState extends RegisterState {}

class RegisterCompletedFlow extends RegisterState {}
