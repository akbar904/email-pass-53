
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.flutter_cubit_app/widgets/login_form.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginForm Widget Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
			when(() => mockAuthCubit.state).thenReturn(AuthInitial());
		});

		testWidgets('renders email and password TextFields and a login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (_) => mockAuthCubit,
						child: LoginForm(),
					),
				),
			);

			expect(find.byType(TextField), findsNWidgets(2));
			expect(find.text('Email'), findsOneWidget);
			expect(find.text('Password'), findsOneWidget);
			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Login'), findsOneWidget);
		});

		testWidgets('invokes login on AuthCubit when login button is pressed', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (_) => mockAuthCubit,
						child: LoginForm(),
					),
				),
			);

			await tester.enterText(find.widgetWithText(TextField, 'Email'), 'test@example.com');
			await tester.enterText(find.widgetWithText(TextField, 'Password'), 'password123');
			await tester.tap(find.byType(ElevatedButton));

			verify(() => mockAuthCubit.login('test@example.com', 'password123')).called(1);
		});
	});

	group('LoginForm Cubit Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		blocTest<MockAuthCubit, AuthState>(
			'emits [AuthLoading, AuthLoggedIn] when login is successful',
			build: () => mockAuthCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [AuthLoading(), AuthLoggedIn()],
			verify: (_) {
				verify(() => mockAuthCubit.login('test@example.com', 'password123')).called(1);
			},
		);

		blocTest<MockAuthCubit, AuthState>(
			'emits [AuthLoading, AuthError] when login fails',
			build: () => mockAuthCubit,
			act: (cubit) {
				when(() => cubit.login(any(), any())).thenThrow(Exception('Login Failed'));
				cubit.login('test@example.com', 'password123');
			},
			expect: () => [AuthLoading(), AuthError('Login Failed')],
			verify: (_) {
				verify(() => mockAuthCubit.login('test@example.com', 'password123')).called(1);
			},
		);
	});
}
