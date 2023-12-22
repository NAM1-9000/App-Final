import 'package:final22735/business%20logic/cubits/auth/auth_cubit.dart';
import 'package:final22735/business%20logic/cubits/data_cubit.dart';
import 'package:final22735/firebase_options.dart';
import 'package:final22735/presentation/screens/q1.dart';
import 'package:final22735/presentation/screens/q2_ui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DataCubit(),
          child: MyApp(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/q2ui': (context) => const Q2UI(),
          '/q1': (context) => const Q1(),
        },
      ),
    );
  }
}
