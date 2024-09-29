
import 'package:flutter/material.dart';
import '../widgets/login_form.dart';
import '../cubits/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
	const LoginScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Login'),
			),
			body: Center(
				child: Padding(
					padding: const EdgeInsets.all(16.0),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: const <Widget>[
							LoginForm(),
						],
					),
				),
			),
		);
	}
}
