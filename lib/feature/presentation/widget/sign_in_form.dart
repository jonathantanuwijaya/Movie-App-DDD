import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/feature/application/auth/auth_bloc.dart';
import 'package:movieapp/feature/presentation/widget/buyticket_button.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const Text(
                'Welcome to Movie App',
                style: TextStyle(fontSize: 22, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    fillColor: Colors.black,
                    focusColor: Colors.black,
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email'),
                autocorrect: false,
                onChanged: (value) =>
                    context.read<AuthBloc>().add(AuthEvent.emailChanged(value)),
                validator: (_) => context
                    .read<AuthBloc>()
                    .state
                    .emailAddress
                    .value
                    .fold(
                        (l) => l.maybeMap(
                            invalidEmail: (_) => 'Invalid Email',
                            orElse: () => null),
                        (_) => null),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    fillColor: Colors.black,
                    prefixIcon: Icon(Icons.password),
                    labelText: 'Password'),
                autocorrect: false,
                onChanged: (value) => context
                    .read<AuthBloc>()
                    .add(AuthEvent.passwordChanged(value)),
                validator: (_) => context
                    .read<AuthBloc>()
                    .state
                    .password
                    .value
                    .fold(
                        (l) => l.maybeMap(
                            shortPassword: (_) => 'Short Password',
                            orElse: () => null),
                        (_) => null),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('button clicked');
                  context.read<AuthBloc>().add(AuthEvent.signIn());
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    height: 45,
                    color: Colors.deepPurpleAccent,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text('Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              if (state.isSubmitting) ...[
                const SizedBox(
                  height: 8,
                ),
                const LinearProgressIndicator(
                  value: null,
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
