import 'package:chat/app/models/user/user_model.dart';

abstract class AuthenticationService {
  Future<UserModel> getCurrentUser();
  Future<UserModel> getCurrentCachedUser();
  Future<dynamic> signInWithPhone(String phoneNumber);

  Future<bool> signOut();
}

class FirebaseAuthenticationService extends AuthenticationService {
  @override
  Future<UserModel> getCurrentCachedUser() {
    // TODO: implement getCurrentCachedUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getCurrentUser() async {
    return Future.delayed(Duration(seconds: 1), () {
      return UserModel(
        userID: '001',
        name: 'Firebase',
      );
    });
  }

  @override
  Future signInWithPhone(String phoneNumber) {
    // TODO: implement signInWithPhone
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

class AWSAuthenticationService extends AuthenticationService {
  @override
  Future<UserModel> getCurrentCachedUser() {
    // TODO: implement getCurrentCachedUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getCurrentUser() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return UserModel(
        userID: '002',
        name: 'AWS',
      );
    });
  }

  @override
  Future signInWithPhone(String phoneNumber) {
    // TODO: implement signInWithPhone
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

/* Abstract - обычный класстан айырмасы бул обычный класс -
 бул эч кандай жумуш аткарбайт - 
 бирок бул кластын ичинде мыналар болуш керек деген шарт болот -
 колдонгондо ушуларды жасаш керек экен деп жасап кете бересин */
abstract class EnterService {
  Future<UserModel> getCurrentUser();
  Future<UserModel> signInWithPhone(String phoneNumber);
}

class FirebaseEnterService extends EnterService {
  @override
  Future<UserModel> getCurrentUser() {
    // TODO(Janibek - tashtap ketiptir ishin buturgon jok eken - kiyin komandadan surasak bolot): implement getCurrentUser

    throw UnimplementedError(); // atkarylgan emes
  }

  @override
  Future<UserModel> signInWithPhone(String phoneNumber) {
    // TODO: implement signInWithPhone
    throw UnimplementedError();
  }
}
