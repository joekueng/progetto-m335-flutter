import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:progetto_m335_flutter/pages/LoginView.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String email = '';
  String password = '';
  bool showPassword = false;
  Color buttonColor = Colors.blue[200]!;

  void register() async {
    print("$email $password");
    if (_formkey.currentState!.validate()) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Map userData = {};
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (val) {
                          setState(() {
                            email = val;
                            if (password.length > 6 && _formkey.currentState!.validate()) {
                              buttonColor = Colors.blue[400]!;
                            } else {
                              buttonColor = Colors.blue[200]!;
                            }
                          });
                        },
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter email address'),
                          EmailValidator(
                              errorText: 'Please correct email filled'),
                        ]),
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0)))),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: !showPassword,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                              if (password.length > 6 && _formkey.currentState!.validate()) {
                                buttonColor = Colors.blue[400]!;
                              } else {
                                buttonColor = Colors.blue[200]!;
                              }
                            });
                          },
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Enter a password'),
                            PatternValidator(
                                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$',
                                errorText: 'enter a valid password'),
                          ]),
                          decoration: InputDecoration(
                              hintText: 'Password',
                              labelText: 'Password',
                              prefixIcon: const Icon(
                                Icons.key,
                                color: Colors.grey,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: IconButton(
                                    icon: Icon(
                                      showPassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    }),
                              ),
                              errorStyle: const TextStyle(fontSize: 18.0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9.0)))),
                        )),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                        // margin: EdgeInsets.fromLTRB(200, 20, 50, 0),
                        width: MediaQuery.of(context).size.width,

                        height: 50,
                        // margin: EdgeInsets.fromLTRB(200, 20, 50, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          onPressed: () {
                            register();
                          },
                        ),
                      ),
                    )),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: TextButton(
                            child: const Text('Already have an account? Login'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginView()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
