
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class UserDataLoaded extends ProfileState {
  String userName;
  String email;
  String image;

  UserDataLoaded({required this.userName , required this.email , required this.image});
}