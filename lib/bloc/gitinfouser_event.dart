part of 'gitinfouser_bloc.dart';

@immutable
abstract class GitinfouserEvent {}

// class GetUsersEvent extends GitinfouserEvent {
//   final String username;

//   GetUsersEvent(this.username);
// }

class GetUsersEvent extends GitinfouserEvent {
  GetUsersEvent() : super();
}
