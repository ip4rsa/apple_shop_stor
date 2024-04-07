import 'package:apple_shop/Screens/test.dart';
import 'package:apple_shop/bloc/authentication/auth_State.dart';
import 'package:apple_shop/bloc/authentication/auth_bloc.dart';
import 'package:apple_shop/bloc/authentication/auth_event.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _usernameTextcontroller = TextEditingController(text: 'amirahmad');
  final _passwordTextController = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: BlocProvider(
        create: (context) => authBloc(),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/appleLogoWaith.png',
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'اپل شاپ',
                      style: TextStyle(
                          fontSize: 24, color: Colors.white, fontFamily: 'sb'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _usernameTextcontroller,
                        decoration: InputDecoration(
                            hintText: ' نام کاربری',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: blue, width: 2),
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _passwordTextController,
                        decoration: InputDecoration(
                            hintText: ' رمز عبور',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: blue, width: 2),
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      const SizedBox(height: 25),
                      BlocBuilder<authBloc, authState>(
                        builder: (context, state) {
                          if (state is authInotioateState) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'sb',
                                ),
                                minimumSize: const Size(200, 48),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: blue,
                              ),
                              onPressed: () {
                                BlocProvider.of<authBloc>(context).add(
                                    authLoginRequest(
                                        _usernameTextcontroller.text,
                                        _passwordTextController.text));
                              },
                              child: const Text(
                                'ورود به حساب کاربری',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }
                          if (state is authLodingState) {
                            return CircularProgressIndicator();
                          }
                          if (state is authResponeState) {
                            Text widget = Text('');
                            state.respone.fold((l) {
                              widget = Text(l);
                            }, (r) {
                              widget = Text(r);
                            });
                            return widget;
                          }
                          return Text('erroe');
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
