
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.flutter_cubit_app/screens/login_screen.dart';

// Mock dependencies if necessary (e.g., AuthCubit)
class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('renders LoginForm widget', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: LoginScreen(),
				),
			);

			expect(find.byType(LoginForm), findsOneWidget);
		});
		
		testWidgets('contains a title text', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: LoginScreen(),
				),
			);

			expect(find.text('Login'), findsOneWidget);
		});
	});

	group('LoginScreen Cubit Tests', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		blocTest<AuthCubit, AuthState>(
			'emits [] when nothing is added',
			build: () => authCubit,
			expect: () => [],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [AuthState.loggedIn] when login is successful',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [AuthState.loggedIn()],
		);
	});
}
