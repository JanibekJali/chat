import 'package:chat/app/models/user/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationLoadingState extends AuthenticationState {}

class UnAuthenticatedState extends AuthenticationState {}

class NoLocationPermissionState extends AuthenticationState {}

class AuthenticatedUserState extends AuthenticationState {
  final UserModel user;

  AuthenticatedUserState(this.user);

  @override
  List<Object> get props => [user];
}

class AuthenticationFailureState extends AuthenticationState {
  final String message;

  AuthenticationFailureState(this.message);

  @override
  List<Object> get props => [message];
}

// class OtpVerificationState extends AuthenticationState {
//   final String phoneNumber;

//   OtpVerificationState(this.phoneNumber);

//   @override
//   List<Object> get props => [phoneNumber];
// }

class NewUserState extends AuthenticationState {
  final UserCredential user;

  NewUserState(this.user);

  @override
  List<Object> get props => [user];
}
