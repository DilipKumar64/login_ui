import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_ui/constants.dart';
import 'package:login_ui/screens/component/custom_text_form_field.dart';

import '../../bloc/bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String id = 'register_screen';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

// context.read<TasksBloc>().add(AddTask(task: task));
class _RegisterScreenState extends State<RegisterScreen> {
  final _emailRegKey = GlobalKey<FormState>();
  final _emailConroller = TextEditingController();
  final _passwordConroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(24),
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(gradient: scaffoldGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80.h,
              ),
              Text(
                'Email Registration',
                style: textTheme.headlineMedium,
              ),
              SizedBox(
                height: 60.h,
              ),
              Form(
                key: _emailRegKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your email';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Please a valid Email';
                        }
                        return null;
                      },
                      controller: _emailConroller,
                      hintText: 'Enter username',
                      isPassword: false,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a password';
                          }
                          if (value.length < 6) {
                            return 'Password shold have atleast 6 charactor';
                          }
                          return null;
                        },
                        controller: _passwordConroller,
                        hintText: 'Password',
                        isPassword: true),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthRegistered) {
                    Navigator.pop(context);
                  }
                },
                child: InkWell(
                  onTap: () {
                    if (_emailRegKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(RegisterUser(
                          email: _emailConroller.text,
                          password: _passwordConroller.text));
                    }
                  },
                  child: Container(
                    height: 53.h,
                    width: size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFf26969).withOpacity(0.3),
                          blurRadius: 30,
                          offset: const Offset(0, 20),
                        ),
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFf26969),
                          Color(0xFFfd6b68),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Register',
                        style: textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
