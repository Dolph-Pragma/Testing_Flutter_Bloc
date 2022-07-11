part of 'gitinfouser_bloc.dart';

@immutable
abstract class GitinfouserState {
  final bool existUsers;
  final List<GitUsersAdvanced>? users;

  const GitinfouserState({this.users, this.existUsers = false});
}

class GitinfouserInitialState extends GitinfouserState {
  const GitinfouserInitialState() : super(users: null, existUsers: false);
}

class GitinfouserSetState extends GitinfouserState {
  final List<GitUsersAdvanced> users;
  const GitinfouserSetState(this.users) : super(users: users, existUsers: true);
}
