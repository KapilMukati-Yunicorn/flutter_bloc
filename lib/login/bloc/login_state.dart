import 'package:equatable/equatable.dart';
import 'package:statemanagement_bloc/login/models/login_res_model.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadedState extends LoginState {
  LoginResponseModel? loginResponseModel;
  LoginLoadedState({this.loginResponseModel});

  @override
  List<Object?> get props => [loginResponseModel];
}

class LoginErrorState extends LoginState {
  String? errorMSG;
  LoginErrorState({this.errorMSG});

  @override
  List<Object?> get props => [errorMSG];
}
