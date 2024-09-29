
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:com.example.flutter_cubit_app/screens/home_screen.dart';

// Mock AuthCubit for testing
class MockAuthCubit extends MockCubit<void> implements AuthCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('Displays a Logout Button', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (_) => MockAuthCubit(),
						child: HomeScreen(),
					),
				),
			);

			// Act & Assert
			expect(find.text('Logout'), findsOneWidget);
		});

		testWidgets('Tapping Logout Button triggers logout', (WidgetTester tester) async {
			// Arrange
			final mockAuthCubit = MockAuthCubit();
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (_) => mockAuthCubit,
						child: HomeScreen(),
					),
				),
			);

			// Act
			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			// Assert
			verify(() => mockAuthCubit.logout()).called(1);
		});
	});
}
