import 'package:injectable/injectable.dart';
import 'package:movieapp/feature/domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movieapp/feature/domain/auth/i_auth_facade.dart';
import 'package:movieapp/feature/domain/auth/user.dart';
import 'package:movieapp/feature/domain/auth/value_objects.dart';

@Injectable(as: IAuthFacade)
class AuthRepository implements IAuthFacade {
  final List<User> userList = [
    User(
        emailAddress: EmailAddress('jack@mail.com'),
        password: Password('jack123')),
    User(
        emailAddress: EmailAddress('budi@mail.com'), password: Password('b123'))
  ];
  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final filteredUserList = userList.where((element) =>
        (element.emailAddress == emailAddress && element.password == password));
    if (filteredUserList.isEmpty) {
      return left(AuthFailure.invalidEmailAndPass());
    } else {
      return right(unit);
    }
  }
}
