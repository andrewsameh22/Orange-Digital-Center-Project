import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_flutter/ResuableWidgets/TXTFld.dart';
import 'package:odc_flutter/ResuableWidgets/default_button.dart';
import 'package:odc_flutter/business_logic/login_cubit.dart';
import 'package:odc_flutter/presentation/styles/colours.dart';
import 'package:odc_flutter/presentation/styles/constants.dart';

import '../signup/signup_screen.dart';

// ignore_for_file: prefer_const_constructors

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isPass = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Center(
                    child: Image.asset(
                      ODCImg,
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.height * 1,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 40.0,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TxtFld(
                    controller: emailController,
                    label: 'E-Mail',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter your email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TxtFld(
                    controller: passwordController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter your password';
                      }
                      return null;
                    },
                    label: 'Password',
                    isPassword: isPass,
                    sicon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPass = !isPass;
                        });
                      },
                      icon: Icon(
                        isPass ? Icons.visibility_off : Icons.visibility,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontSize: 14,
                              color: primaryColor,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  defButton(
                    context: context,
                    text: 'Login',
                    color: primaryColor,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        print('Sign In');
                        cubit.login(
                          context: context,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Divider(
                        indent: 4,
                        height: 1,
                        color: Colors.grey,
                        thickness: 1,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "OR",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        endIndent: 4,
                        height: 1,
                        color: Colors.grey,
                        thickness: 1,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  emptydefButton(
                    context: context,
                    text: 'Sign Up',
                    color: primaryColor,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
