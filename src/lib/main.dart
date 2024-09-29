
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/auth_cubit.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
	runApp(MainApp());
}

class MainApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			create: (context) => AuthCubit(),
			child: MaterialApp(
				title: 'Flutter Cubit App',
				home: BlocBuilder<AuthCubit, AuthState>(
					builder: (context, state) {
						if (state == AuthState.loggedIn) {
							return HomeScreen();
						} else {
							return LoginScreen();
						}
					},
				),
			),
		);
	}
}
