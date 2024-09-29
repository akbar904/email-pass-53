
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubit.dart';

class LoginForm extends StatefulWidget {
	const LoginForm({Key? key}) : super(key: key);

	@override
	_LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.all(16.0),
			child: Column(
				children: [
					TextField(
						controller: _emailController,
						decoration: InputDecoration(
							labelText: 'Email',
						),
					),
					TextField(
						controller: _passwordController,
						decoration: InputDecoration(
							labelText: 'Password',
						),
						obscureText: true,
					),
					ElevatedButton(
						onPressed: () {
							final email = _emailController.text;
							final password = _passwordController.text;
							context.read<AuthCubit>().login(email, password);
						},
						child: Text('Login'),
					),
				],
			),
		);
	}
}
