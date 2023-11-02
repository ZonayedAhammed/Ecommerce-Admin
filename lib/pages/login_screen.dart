import 'dart:ffi';
import 'package:database_firebase_acc/auth/auth_services.dart';
import 'package:database_firebase_acc/pages/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginScreen extends StatefulWidget {
static const String routeName = '/login';
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;
  String errMsg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 4),
                child: TextFormField(
                  style: TextStyle(color: Colors.amber[600], fontStyle: FontStyle.italic,fontSize: 30),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email Address',
                    labelStyle: TextStyle(color: Colors.amber[600], fontSize: 30.0),
                    prefix: const Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 4),
                child: TextFormField(
                  style: TextStyle(color: Colors.amber[600],
                      fontStyle: FontStyle.italic,fontSize: 20),
                  obscureText: isVisible,
                  controller: _passController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.amber[600], fontSize: 30.0),
                      prefix: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(isVisible ? Icons.visibility_off : Icons
                            .visibility),
                      )
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: _loginAdmin,
                  child: const Text("LOGIN")
              ),
              Text(errMsg, style: const TextStyle(fontSize: 16, color: Colors.red),),
            ],
          ),
        ),
      ),
    );
  }
  void _loginAdmin() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passController.text;
      EasyLoading.show(status:'Please wait');
      try {
        final status = await AuthService.loginAdmin(email, password);
        EasyLoading.dismiss();
        if(status){
        Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
      }
        else{
          setState(() {
            errMsg  = 'This email is not associated with an Admin account.';
          });
        }
      }
      on FirebaseAuthException catch (error) {
        EasyLoading.dismiss();
        setState(() {
          errMsg = error.message!;
        });
      }
    }
  }
}