import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:football/api/crud.dart';
import 'package:football/pages/login/model/button.dart';
import 'package:football/services/user_auth/authentication.dart';
import 'package:football/services/user_auth/user.dart';
import 'package:football/widgets/footy_scaffold.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin(
      {Key? key,
      required this.auth,
      required this.loginCallback,
      required this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback loginCallback;
  final VoidCallback logoutCallback;
  @override
  _EmailLoginState createState() => _EmailLoginState();
}

enum FormType { main, login, register, reset }

class _EmailLoginState extends State<EmailLogin> {
  static final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  CrudMethods crudObj = CrudMethods();
  String? _email, _fullNames, _password, phoneNo;
  double offset = 0;
  String? _authHint = '';
  FormType _formType = FormType.login;
  bool _isLoading = false, codeSent = false;

  @override
  void initState() {
    super.initState();
  }

  bool validateAndSave() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      setState(() {
        _isLoading = true;
      });
      try {
        String? userId;
        if (_formType == FormType.login) {
          userId = await widget.auth.signIn(_email, _password);
        } else {
          userId = await widget.auth.signUp(_email, _password);
        }
        setState(() {
          _isLoading = false;
        });
        if (_formType == FormType.register) {
          UserData userData = UserData(
            userId: FirebaseAuth.instance.currentUser!.uid,
            fullNames: _fullNames,
            email: _email,
            phone: phoneNo,
            picture:
                "https://firebasestorage.googleapis.com/v0/b/sports-rs.appspot.com/o/defaults%2Fpexels-jessica-lewis-867470.jpg?alt=media&token=9ec26189-feee-4e21-bac9-5fde6d2061c2",
            lastseen: DateTime.now(),
            created: DateTime.now(),
          );
          crudObj.createOrUpdateUserData(userData.getDataMap());
        }
        if (userId == null && _formType == FormType.login) {
          setState(() {
            _authHint =
                'Your email is not Verified.\nCheck your email for a verify link';
            _isLoading = false;
            _formType = FormType.login;
          });
        } else {
          _isLoading = false;
          _authHint = '';
          widget.loginCallback();
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          _isLoading = false;
          switch (e.code) {
            case "invalid-email":
              _authHint = "Your email address appears to be malformed.";
              break;
            case "email-already-in-use":
              _authHint = "Email address already used in a different account.";
              break;
            case "wrong-password":
              _authHint = "The password you entered is wrong.";
              break;
            case "user-not-found":
              _authHint = "User with this email doesn't exist.";
              break;
            default:
              _authHint = "An undefined Error happened.";
          }
        });
      }
    } else {
      setState(() {
        _authHint = '';
      });
    }
  }

  void moveToRegister() {
    _formKey.currentState!.reset();
    setState(() {
      _formType = FormType.register;
      _authHint = '';
    });
  }

  void moveToReset() {
    _formKey.currentState!.reset();
    setState(() {
      _formType = FormType.reset;
      _authHint = '';
    });
  }

  void moveToLogin() {
    _formKey.currentState!.reset();
    setState(() {
      _formType = FormType.login;
      _authHint = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FootballScaffold(
      title: _formType == FormType.register
          ? "Sign Up"
          : _formType == FormType.login
              ? "Login"
              : "Forgot Password",
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 10.0,
              ),
              Text(
                _formType == FormType.login
                    ? "Log In With Your Email"
                    : _formType == FormType.register
                        ? "Create a New Account"
                        : "Reset Your Password",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 10.0,
              ),
              _authHint == "" ? Container() : hintText(),
              _formType == FormType.register
                  ? _buildNameField()
                  : Container(height: 0.0),
              const SizedBox(
                height: 5.0,
              ),
              _buildEmailField(),
              const SizedBox(
                height: 5.0,
              ),
              _formType == FormType.register ? _buildPhoneField() : Container(),
              const SizedBox(
                height: 5.0,
              ),
              _formType != FormType.reset ? _buildPasswordField() : Container(),
              const SizedBox(
                height: 5.0,
              ),
              _formType == FormType.register
                  ? _builConfirmPasswordTextField()
                  : Container(),
              const SizedBox(
                height: 5.0,
              ),
              const SizedBox(
                height: 5.0,
              ),
              _isLoading == false
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: submitWidgets(),
                    )
                  : _showCircularProgress(),
            ],
          )),
    );
  }

  Widget hintText() {
    return Container(
        //height: 80.0,
        padding: const EdgeInsets.all(8.0),
        child: Text(_authHint!,
            key: const Key('hint'),
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.red),
            textAlign: TextAlign.center));
  }

  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        key: const Key('email'),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          labelText: 'Email',
          prefixIcon: Icon(
            Icons.mail,
            color: Theme.of(context).cardColor,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (String? value) {
          if (value!.isEmpty ||
              !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value)) {
            return 'Enter a valid email';
          }
          return null;
        },
        onSaved: (value) => _email = value!.replaceAll(" ", ''),
      ),
    );
  }

  Widget _buildNameField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        key: const Key('namefield'),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          labelText: 'Full Name',
          prefixIcon: Icon(
            Icons.perm_identity,
            color: Theme.of(context).cardColor,
          ),
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Enter your Name';
          }
          return null;
        },
        onSaved: (value) => _fullNames = value,
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        key: const Key('password'),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          labelText: 'Password',
          prefixIcon: Icon(
            Icons.lock,
            color: Theme.of(context).cardColor,
          ),
        ),
        controller: _passwordTextController,
        obscureText: true,
        validator: (String? value) {
          if (value!.isEmpty || value.length < 6) {
            return 'Enter a minimum of 6 characters';
          }
          return null;
        },
        onSaved: (value) => _password = value,
      ),
    );
  }

  Widget _builConfirmPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          labelText: 'Confirm Password',
          prefixIcon: Icon(
            Icons.lock,
            color: Theme.of(context).cardColor,
          ),
        ),
        obscureText: true,
        validator: (String? value) {
          if (_passwordTextController.text != value) {
            return 'Passwords don\'t correspond';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPhoneField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        initialValue: '+1',
        keyboardType: TextInputType.number,
        key: const Key('phone'),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          labelText: 'Phone',
          hintText: '+448000000000',
          prefixIcon: Icon(
            Icons.phone,
            color: Theme.of(context).cardColor,
          ),
        ),
        validator: (value) {
          if (value!.isEmpty || value.length < 12) {
            return 'Enter a valid Phone Number';
          }
          return null;
        },
        onSaved: (value) {
          phoneNo = value;
        },
      ),
    );
  }

  Widget submitWidgets() {
    switch (_formType) {
      case FormType.login:
        return ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: <Widget>[
            PrimaryButton(
              key: const Key('login'),
              text: 'Login',
              height: 44.0,
              textColor: Theme.of(context).backgroundColor,
              onPressed: validateAndSubmit,
            ),
            const SizedBox(height: 10.0),
            // SizedBox(height: 10),
            TextButton(
                key: const Key('reset-account'),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: moveToReset),
            TextButton(
                key: const Key('new-account'),
                child: Text(
                  "Create a New Account",
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: moveToRegister),
            const SizedBox(height: 10.0),
          ],
        );
      case FormType.reset:
        return ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: <Widget>[
            PrimaryButton(
                key: const Key('reset'),
                text: 'Reset Password',
                textColor: Theme.of(context).backgroundColor,
                height: 44.0,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget.auth.resetPassword(_email);
                    setState(() {
                      _authHint = 'Reset Link Sent, Check your email';
                      _formType = FormType.login;
                    });
                  }
                }),
            const SizedBox(height: 10.0),
            TextButton(
                key: const Key('need-login'),
                child: Text(
                  "Already a Member ? Login",
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: moveToLogin),
            const SizedBox(height: 10.0),
          ],
        );

      default:
        return ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: <Widget>[
            PrimaryButton(
              key: const Key('register'),
              text: 'Sign Up',
              textColor: Theme.of(context).backgroundColor,
              height: 44.0,
              onPressed: validateAndSubmit,
            ),
            const SizedBox(height: 20.0),
            TextButton(
                key: const Key('need-login'),
                child: Text(
                  "Already a Member? Login",
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: moveToLogin),
            const SizedBox(height: 20.0),
          ],
        );
    }
  }

  Widget _showCircularProgress() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
