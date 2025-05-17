part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final Username username;
  final Email email;
  final Password password;
  final bool isValid;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.username = const Username.pure(),
    this.isValid = false,
    this.password = const Password.pure(),
    this.email = const Email.pure(),
  });

  copyWith({FormStatus? formStatus, Username? username, Email? email, Password? password, bool? isValid}) => RegisterFormState(
    formStatus: formStatus ?? this.formStatus,
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
    isValid: isValid ?? this.isValid,
  );

  @override
  List<Object> get props => [formStatus, username, email, password, isValid];
}
