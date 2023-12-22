import 'package:final22735/business%20logic/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // controllers
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    // form validator key
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, "/homeScreen");
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // email field
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'email',
                          ),
                        ),

                        // password field
                        TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            labelText: 'password',
                          ),
                        ),
                      ],
                    ),
                  ),

                  // login button
                  state is AuthLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthCubit>().emailPasswordSignIn(
                                    emailController.text,
                                    passwordController.text,
                                  );
                            }
                          },
                          child: const Text('Sign In'),
                        ),

                  // sign up button
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signUpScreen');
                    },
                    child: const Text('sign up'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
