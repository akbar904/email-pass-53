
import 'package:bloc/bloc.dart';
import '../models/user_model.dart';

enum AuthState { loggedOut, loggedIn }

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthState.loggedOut);

	void login(String email, String password) {
		// Logic for user login
		// For simplicity, we'll assume the login is always successful
		emit(AuthState.loggedIn);
	}

	void logout() {
		// Logic for user logout
		emit(AuthState.loggedOut);
	}
}
