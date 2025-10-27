import 'package:equatable/equatable.dart';
import '../../../models/login_model.dart';

class LoginState extends Equatable {
  final LoginModel loginModel;
  final bool isPasswordVisible;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const LoginState({
    required this.loginModel,
    this.isPasswordVisible = false,
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  factory LoginState.initial() {
    return LoginState(
      loginModel: LoginModel(email: "", password: ''),
    );
  }

  LoginState copyWith({
    LoginModel? loginModel,
    bool? isPasswordVisible,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return LoginState(
      loginModel: loginModel ?? this.loginModel,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    loginModel,
    isPasswordVisible,
    isLoading,
    isSuccess,
    errorMessage,
  ];
}
