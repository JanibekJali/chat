import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? userID;
  final String? name;

  UserModel({this.userID, this.name});
  @override
  List<Object?> get props => [
        userID,
        name,
      ];
}
