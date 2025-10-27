import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    bool _isObscure = true;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Text(
          "SignUp Screen",
          style: TextStyle(fontSize: 32, color: Colors.deepPurple),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.deepPurple),
                  labelText: "Email",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 1),
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
              ),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password, color: Colors.deepPurple),
                  labelText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.deepPurple,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 1),
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
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      children: [
                        TextSpan(
                          text: "LogIn",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8)
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Form is valid. Proceed with login.");
                  } else {
                    print("Form is invalid.");
                  }
                },
                child: Text("Register", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
