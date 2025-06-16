import 'package:auvshop/home/presentation/widgets/home%20ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth/login/data/repositories/Auth Repository.dart';
import 'auth/login/presentation/manager/authh_cubit.dart';
import 'auth/login/presentation/widgets/login ui.dart';
import 'onboariding/onboarding_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://nzufhohdmwjpwwfxnfxs.supabase.co',       // Replace with your Supabase project URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im56dWZob2hkbXdqcHd3ZnhuZnhzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAwNzQzNDAsImV4cCI6MjA2NTY1MDM0MH0.oSSYbtJ7ReL4gA9AVNKPVs8lQgFr1Sd8gFZWbAt4i9U',                         // Replace with your Supabase anon/public key
  );

  runApp(const NawelApp());
}

class NawelApp extends StatelessWidget {
  const NawelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(SupabaseAuthRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Nawel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Poppins',
        ),
        initialRoute: '/onboarding',
        routes: {
          '/onboarding': (_) => const OnboardingPage(),
          '/login': (_) => const LoginPage(),
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
