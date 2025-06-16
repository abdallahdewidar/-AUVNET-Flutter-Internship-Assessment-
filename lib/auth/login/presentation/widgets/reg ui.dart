import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../manager/authh_cubit.dart';
import '../manager/authh_state.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Register Successful')));
            Navigator.pop(context);
          } else if (state?.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(controller: email, decoration: const InputDecoration(labelText: 'Email')),
                TextField(controller: password, decoration: const InputDecoration(labelText: 'Password'), obscureText: true)
              ,TextField(controller: password, decoration: const InputDecoration(labelText: ' confirmPassword'), obscureText: true),
                const SizedBox(height: 16),
                ElevatedButton(
                  style:ButtonStyle(backgroundColor:WidgetStatePropertyAll(Color(0xff8900FE)) ),
                  onPressed: state!.isLoading
                      ? null
                      : () {
                    context.read<AuthCubit>().register(email.text, password.text);
                  },
                  child: Text(state!.isLoading ? 'Registering...' : 'Register'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
