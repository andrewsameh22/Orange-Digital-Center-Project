import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ResuableWidgets/TXTFld.dart';
import '../../../ResuableWidgets/default_button.dart';
import '../../../business_logic/signup/signup_cubit.dart';
import '../../styles/colours.dart';
import '../../styles/constants.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isPass = true;
  bool reisPass = true;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignupCubit cubit = SignupCubit.get(context);

    return BlocBuilder<SignupCubit, SignupState>(
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Signup',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 40.0,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TxtFld(
                    controller: cubit.nameController,
                    label: 'Name',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TxtFld(
                    controller: cubit.emailController,
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
                    controller: cubit.phoneNumberController,
                    keyType: TextInputType.phone,
                    label: 'Phone Number',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TxtFld(
                    controller: cubit.passwordController,
                    label: 'Password',
                    isPassword: isPass,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter your password';
                      }
                      return null;
                    },
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
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TxtFld(
                    controller: cubit.confirmPasswordController,
                    label: 'Confirm Your Password',
                    isPassword: reisPass,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter your email address';
                      } else if (cubit.passwordController.text !=
                          cubit.confirmPasswordController.text)
                        return 'passwords don\'t match';
                      return null;
                    },
                    sicon: IconButton(
                      onPressed: () {
                        setState(() {
                          reisPass = !reisPass;
                        });
                      },
                      icon: Icon(
                        reisPass ? Icons.visibility_off : Icons.visibility,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  defButton(
                    context: context,
                    text: 'Sign Up',
                    color: primaryColor,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        // print('Sign UP');
                        cubit.postSignup(context);
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
                    text: 'Sign In',
                    color: primaryColor,
                    onTap: () {},
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
