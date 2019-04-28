import 'package:hayum/models/auth_model.dart';
import 'package:hayum/service/auth_service.dart';

class AuthRepository {
  final authService = AuthService();

  Future<Auth> loginUser(Map<String, dynamic> data) =>
      authService.loginUser(data);
}
