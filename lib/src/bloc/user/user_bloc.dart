import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:bloc_state/src/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

//-Tiene la informacion de cual es el estado actual y procesa los eventos
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) => emit(UserActivedState(event.user)));

    on<SetUserAge>((event, emit) {
      if(state.existUser){
        emit(UserActivedState(state.user!.copyWith(birthday: event.birthday)));
      }
    });

    on<AddUserProfession>((event, emit) {
      if(state.existUser){
        final user = state.user!;
        emit(UserActivedState(user.copyWith(professions: [...user.professions, event.profession])));
      }
    });

    on<DeleteUser>((event, emit) => emit(const UserInitialState()));
  }
}