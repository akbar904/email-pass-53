
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_cubit_app/cubits/auth_cubit.dart';

// Mocking dependencies if any (for example, a repository or API service)
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
  group('AuthCubit', () {
    late AuthCubit authCubit;

    setUp(() {
      authCubit = AuthCubit();
    });

    tearDown(() {
      authCubit.close();
    });

    blocTest<AuthCubit, AuthState>(
      'emits [AuthState.loggedIn] when login is successful',
      build: () => authCubit,
      act: (cubit) => cubit.login('test@example.com', 'password123'),
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
