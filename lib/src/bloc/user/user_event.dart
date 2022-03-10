part of 'user_bloc.dart';

//-Son acciones que se disparan y llegan al bloc
@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final User user;
  ActivateUser(this.user);
}

class SetUserAge extends UserEvent {
  final DateTime birthday;
  SetUserAge(this.birthday);
}

class AddUserProfession extends UserEvent {
  final String profession;
  AddUserProfession(this.profession);
}

//-No se necesita ninguna propiedad porque solo se reinicilizara en el evento al estado inicial
class DeleteUser extends UserEvent {}
