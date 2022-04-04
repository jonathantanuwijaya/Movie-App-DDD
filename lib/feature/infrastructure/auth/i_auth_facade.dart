import 'package:movieapp/feature/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future<void> signIn({
    required EmailAddress emailAddress,
    required Password password
  });
  }