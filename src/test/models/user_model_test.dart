
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_package_name/models/user_model.dart';

void main() {
	group('User Model Tests', () {
		test('User model should serialize from JSON correctly', () {
			// Arrange
			final json = {
				'id': '123',
				'email': 'test@example.com',
			};

			// Act
			final user = User.fromJson(json);

			// Assert
			expect(user.id, '123');
			expect(user.email, 'test@example.com');
		});

		test('User model should serialize to JSON correctly', () {
			// Arrange
			final user = User(id: '123', email: 'test@example.com');

			// Act
			final json = user.toJson();

			// Assert
			expect(json['id'], '123');
			expect(json['email'], 'test@example.com');
		});
	});
}
