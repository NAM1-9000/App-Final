import 'package:final22735/business%20logic/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // controllers
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController numberController = TextEditingController();

    // form validator key
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/signInScreen');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('sign up'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushReplacementNamed(
                  context,
                  '/homeScreen',
                );
              } else if (state is AuthFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
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

                        // name field
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'name',
                          ),
                        ),

                        // number field
                        TextFormField(
                          controller: numberController,
                          decoration: const InputDecoration(
                            labelText: 'number',
                          ),
                        ),
                      ],
                    ),
                  ),

                  // sign up button
                  state is AuthLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthCubit>().emailPasswordSignUp(
                                    emailController.text,
                                    passwordController.text,
                                    nameController.text,
                                    numberController.text,
                                  );
                            }
                          },
                          child: const Text('sign up'),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
