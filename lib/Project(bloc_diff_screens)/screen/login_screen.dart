import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/login/login_auth_event.dart';
import '../bloc/auth/login/login_auth_bloc.dart';
import './profile_page.dart';
import '../bloc/auth/login/login_auth_state.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    // bool _isObscure;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Text(
          "Login Screen",
          style: TextStyle(fontSize: 32, color: Colors.deepPurple),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ProfileScreen(user: state.loginModel),
              ),
            );
          } else if (state.errorMessage != null && !state.isSuccess) {
            // Login failed → Stay on login page + show error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage.toString())),
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.deepPurple),
                        labelText: "Email",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Pls Enter your Email";
                        }
                      },
                      onChanged: (value) => context.read<LoginBloc>().add(
                        LoginEmailChanged(value),
                      ),
                    );
                  },
                ),

                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return TextFormField(
                      obscureText: state.isPasswordVisible,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.deepPurple,
                        ),
                        labelText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () => context.read<LoginBloc>().add(
                            TogglePasswordVisibility(),
                          ),
                          icon: Icon(
                            state.isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.deepPurple,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password Can't be Empty";
                        }
                        return null;
                      },
                      onChanged: (value) => context.read<LoginBloc>().add(
                        LoginPasswordChanged(value),
                      ),
                    );
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        children: [
                          TextSpan(
                            text: "SignUp Here",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 8,
                        ),
                      ),
                      onPressed: state.isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(builder: (context) => ProfileScreen(user:,)),
                                // );
                                context.read<LoginBloc>().add(LoginSubmit());
                                print("Form is valid. Proceed with login.");
                              } else {
                                print("Form is invalid.");
                              }
                            },
                      child: state.isLoading
                          ? Center(child: const CircularProgressIndicator())
                          : Text("LogIn", style: TextStyle(fontSize: 16)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
