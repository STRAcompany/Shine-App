// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  bool _isLogin = true;
  bool _isAuthenticating = false;
  String? emailAddress;
  String? password;

  void _onSaved() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    try {
      setState(() {
        _isAuthenticating = true;
      });
      if (_isLogin) {
        await firebase.signInWithEmailAndPassword(
            email: emailAddress!, password: password!);
      } else {
        await firebase.createUserWithEmailAndPassword(
            email: emailAddress!, password: password!);
      }
      setState(() {
        _isAuthenticating = false;
      });
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication failed.'),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shine"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Text(
              "Shine",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 80),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.onSurface,
                        Theme.of(context).colorScheme.primary,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )),
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface,
                              width: 2,
                            ),
                          ),
                          label: const Text("Enter your Email address"),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.trim().contains("@") ||
                              !value.trim().contains(".com")) {
                            return "Please enter an appropriate email address.";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          emailAddress = newValue;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface,
                              width: 2,
                            ),
                          ),
                          label: const Text("Enter password"),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              value.trim().length < 6) {
                            return "Password must be atleast 6 letters long.";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          password = newValue;
                        },
                      ),
                      const SizedBox(height: 25),
                      if(!_isAuthenticating)
                      ElevatedButton(
                        onPressed: _onSaved,
                        child: Text(_isLogin ? "Login" : "Sign Up"),
                      ),
                      if(_isAuthenticating)
                       const CircularProgressIndicator(),
                      if(!_isAuthenticating)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _isLogin
                                ? "Create a new account."
                                : "Already have an account.",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          TextButton(
                            style: const ButtonStyle(
                              padding:
                                  WidgetStatePropertyAll(EdgeInsets.all(5)),
                            ),
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(
                              _isLogin
                                  ? "Create an Account"
                                  : "Login through account",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: Colors.blue,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
