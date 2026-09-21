import 'package:flutter/material.dart';

class DeniBookLoginPage extends StatefulWidget {
  const DeniBookLoginPage({super.key});

  @override
  State<DeniBookLoginPage> createState() => _DeniBookLoginPageState();
}

  class _DeniBookLoginPageState extends State<DeniBookLoginPage> {
    final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

    bool _isObscured = true;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Center(
          child: Column(
            children: [
              //logo for the splash page
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
                child: Image.asset(
                  'assets/icon/DeniBookSplash.png',
                  height: 230,
                ),
              ),
              //center words "Track Sales, Manage Debts. Grow Your Business"
              const SizedBox(
                height: 55,
                width:250,
                child: Text(
                  'Track Sales, Manage Debts.  Grow Your Business',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: _loginKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your Username',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors.amberAccent,
                              width: 1.5,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.black12,
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your username';
                          } else if (value.length < 2){
                            return 'Username can not be shorter than 2 characters';
                          } else if (value.length > 12){
                            return 'Username can not be longer than 12 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0, bottom: 30.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your Password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors.amberAccent,
                              width: 1.5,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.black12,
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscured ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () {
                              // Rebuilds the UI with the inverted visibility value
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your password';
                          } else if (value.length < 5) {
                            return 'password should not be less than 5 characters';
                          } else if (value.length > 10) {
                            return 'password should not be more than 10 characters';
                          }
                          return null;
                        },
                        obscureText: _isObscured,
                        keyboardType: TextInputType.visiblePassword,
                    ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.95,
                      child: ElevatedButton(
                        //validate will return true if form is valid
                          onPressed: (){
                            if (_loginKey.currentState!.validate()){
                              //process data
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amberAccent,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 5,
                          ),
                          child: const Text('Login')
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        )
      );
    }
  }
