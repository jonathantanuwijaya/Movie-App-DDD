import 'package:flutter/material.dart';
import 'package:movieapp/feature/presentation/widget/buyticket_button.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
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
                  prefixIcon: Icon(Icons.email), labelText: 'Email'),
              autocorrect: false,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password), labelText: 'Password'),
              autocorrect: false,
            ),
            const SizedBox(
              height: 50,
            ),
            BuyTicket()
          ],
        ),
      ),
    );
  }
}
