part of 'user_bloc.dart';

//Estados de nuesto bloc
@immutable
abstract class UserState {
  final bool existUser;
  final User? user;

  const UserState({this.existUser = false, this.user});
}

class UserInitialState extends UserState {
  //-El super llama al constructor del padre
  const UserInitialState() : super(existUser: false, user: null);
} 

class UserActivedState extends UserState {
  final User newUser;
  const UserActivedState(this.newUser) : super(existUser: true, user: newUser);
}