import 'package:bloc/bloc.dart';

import 'login_auth_event.dart';
import 'login_auth_state.dart';

class LoginBloc extends Bloc<AuthLoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    // Email Change.
    on<LoginEmailChanged>((event, emit) {
      state.loginModel.email = event.email;
      emit(state.copyWith());
    });

    //Password Change.
    on<LoginPasswordChanged>((event, emit) {
      state.loginModel.password = event.password;
      emit(state.copyWith());
    });

    // TogglePassword Visibility
    on<TogglePasswordVisibility>((event, emit) {
      print(state.isPasswordVisible);
      state.copyWith(isPasswordVisible: !state.isPasswordVisible);
    });

    //Submit Login.
    on<LoginSubmit>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      await Future.delayed(const Duration(seconds: 2));

      if (state.loginModel.email!.isNotEmpty &&
          state.loginModel.password!.isNotEmpty) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: false,
            errorMessage: "Please enter valid credentials",
          ),
        );
      }
    });
  }
}
