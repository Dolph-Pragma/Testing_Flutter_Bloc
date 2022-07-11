import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pragma_demos_gitinfouser/bloc/gitinfouser_bloc.dart';
import 'package:pragma_demos_gitinfouser/features/gitinfo/git_users_advanced.dart';

void main() {
  test('Testing that GitinfoiserBloc exist', () {
    final gitInfoUserBloc = GitinfouserBloc();

    expect(gitInfoUserBloc, isA<GitinfouserBloc>());
  });

  test('Testing that GitinfouserBloc extends of Bloc', () {
    final gitInfoUserBloc = GitinfouserBloc();

    expect(gitInfoUserBloc, isA<Bloc>());
  });

  test('Testing that GitinfouserBloc have connection with State and Event', () {
    final gitInfoUserBloc = GitinfouserBloc();

    expect(gitInfoUserBloc, isA<Bloc<GitinfouserEvent, GitinfouserState>>());
  });

  test('Testing State Initial', () {
    const gitinfoUserState = GitinfouserInitialState();

    expect(gitinfoUserState, isA<GitinfouserInitialState>());
  });

  test('Testing State Initial extends of State', () {
    const gitinfoUserState = GitinfouserInitialState();

    expect(gitinfoUserState, isA<GitinfouserState>());
  });

  test('State that return List users', () {
    final gitinfouserState = GitinfouserSetState([]);

    expect(gitinfouserState, isA<GitinfouserSetState>());
  });

  test('GitinfouserSetState is a State of Bloc', () {
    final gitinfouserState = GitinfouserSetState([]);

    expect(gitinfouserState, isA<GitinfouserState>());
  });

  test('GitinfouserState receive a List user', () {
    List<GitUsersAdvanced> users = [GitUsersAdvanced(), GitUsersAdvanced()];
    final state = GitinfouserSetState(users);

    expect(state, isA<GitinfouserState>());
  });

  test('Event exist', () {
    final event = GetUsersEvent();

    expect(event, isA<GetUsersEvent>());
  });

  test('Event is GitinfouserEvent', () {
    final event = GetUsersEvent();

    expect(event, isA<GitinfouserEvent>());
  });

  test('Event call in Bloc', () {
    List<GitUsersAdvanced> users = [GitUsersAdvanced(), GitUsersAdvanced()];
    final bloc = GitinfouserBloc();

    bloc.on<GetUsersEvent>((event, emit) {
      emit(GitinfouserSetState(users));
    });

    GetUsersEvent();

    expect(bloc.state, isA<GitinfouserSetState>());
  });
}
