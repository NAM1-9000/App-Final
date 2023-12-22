import 'package:final22735/business%20logic/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
        actions: [
          BlocConsumer<AuthCubit, AuthState>(
            listenWhen: (previous, current) {
              return previous is AuthLoading && current is AuthInitial;
            },
            listener: (context, state) {
              if (state is AuthInitial) {
                Navigator.pushReplacementNamed(context, "/signInScreen");
              }
            },
            builder: (context, state) {
              return IconButton(
                tooltip: "logout",
                icon: const Icon(Icons.logout),
                onPressed: state is AuthLoading
                    ? null
                    : () {
                        context.read<AuthCubit>().emailPasswordSignOut();
                      },
              );
            },
          ),
        ],
      ),
    );
  }
}
