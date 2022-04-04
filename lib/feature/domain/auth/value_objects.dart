import 'package:dartz/dartz.dart';
import 'package:movieapp/core/failures.dart';
import 'package:movieapp/core/value_object.dart';
import 'package:movieapp/core/value_validators.dart';

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;
  factory Password(String input) {
    return Password._(validatePassword(input));
  }
  const Password._(this.value);
}

class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;
  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }
  const EmailAddress._(this.value);
}
