/*

Auth Repository - Outlines the possible auth operations for this app

*/
import 'package:haijuga/features/auth/domain/entitties/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailPassword(String email, String password);
  Future<AppUser?> registerWithEmailPassword(
    String name,
    String email,
    String password,
  );
  Future<void> logout();
  Future<AppUser?> getCurrentUser();
}
