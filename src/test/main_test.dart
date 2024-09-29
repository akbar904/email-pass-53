
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.flutter_cubit_app/main.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('MainApp', () {
		testWidgets('renders LoginScreen initially', (tester) async {
			await tester.pumpWidget(MainApp());

			expect(find.byType(LoginScreen), findsOneWidget);
		});
	});

	group('AuthCubit', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		blocTest<AuthCubit, AuthState>(
			'emits [AuthState.loggedIn] when login is called',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [AuthState.loggedIn],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [AuthState.loggedOut] when logout is called',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [AuthState.loggedOut],
		);
	});
}
