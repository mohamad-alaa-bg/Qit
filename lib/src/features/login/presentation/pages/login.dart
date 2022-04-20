import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qit/src/core/resources/enum.dart';
import 'package:qit/src/core/resources/screen_size.dart';
import 'package:qit/src/core/shared_components/custom_text_form_Field.dart';
import 'package:qit/src/core/shared_components/signin_button.dart';
import 'package:qit/src/core/shared_components/sizedBox.dart';
import 'package:qit/src/injection.dart';

import '../bloc/auth_bloc.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = sl();
    authBloc = BlocProvider.of(context);
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushReplacementNamed(context, 'HomeScreen');
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 61 - ScreenSize.paddingTop(context),
                ),
                child: SizedBox(
                  height: 812,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.only(start: 33),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 73,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const VerticalSizedBox(height: 4),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.only(start: 38, end: 37),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Please login to your account.',
                              style: TextStyle(
                                  color: Color.fromRGBO(29, 34, 38, 0.6),
                                  fontSize: 18),
                            ),
                            const VerticalSizedBox(height: 50),
                            CustomTextFormField(
                              label: 'Email Address',
                              textEditingController: emailController,
                              suffixIcon: Image.asset(
                                  'assets/images/Icon feather-mail.png'),
                            ),
                            const VerticalSizedBox(height: 18),
                            CustomTextFormField(
                              label: 'Password',
                              textEditingController: passwordController,
                              suffixIcon: Image.asset(
                                  'assets/images/Icon feather-lock.png'),
                            ),
                            const VerticalSizedBox(
                              height: 41,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: state is LoginIsLoadingState
                                  ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              )
                                  : ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(26))),
                                    backgroundColor:
                                    MaterialStateProperty.all(
                                        Colors.black),
                                  ),
                                  onPressed: () {
                                    authBloc.add(LoginEvent(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ));
                                  },
                                  child: const Text(
                                    'LOGIN',
                                    style: TextStyle(fontSize: 16),
                                  )),
                            ),
                            const VerticalSizedBox(height: 16),
                            Container(
                                alignment: AlignmentDirectional.centerEnd,
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromRGBO(26, 26, 26, 1)),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const VerticalSizedBox(height: 60),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'or login with',
                            style: TextStyle(
                                color: Color.fromRGBO(157, 157, 157, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                          const VerticalSizedBox(height: 21),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SignInButton(
                                buttonType: ButtonType.google,
                                onPressed: () {},
                              ),
                              SignInButton(
                                buttonType: ButtonType.facebook,
                                onPressed: () {},
                              ),
                              SignInButton(
                                buttonType: ButtonType.twitter,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don’t have an account?',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(26, 26, 26, 1)),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Create new now!',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(26, 26, 26, 1),
                                    decoration: TextDecoration.underline),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'By signing up, you are agree with our',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(26, 26, 26, 1)),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(26, 26, 26, 1),
                                    decoration: TextDecoration.underline),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
