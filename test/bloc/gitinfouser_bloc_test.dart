import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pragma_demos_gitinfouser/bloc/gitinfouser_bloc.dart';
import 'package:pragma_demos_gitinfouser/features/gitinfo/git_users_advanced.dart';
import 'package:pragma_demos_gitinfouser/repository/repository.dart';
import 'package:pragma_demos_gitinfouser/utils/constants.dart';

import 'gitinfouser_bloc_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final client = MockClient();

  when(client.get(Uri.parse('$urlApi$endPointUsers?q=dolph')))
      .thenAnswer((_) async => http.Response(response, 200));

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

  test('Bloc is Initial State', () {
    final bloc = GitinfouserBloc();

    expect(bloc.state, isA<GitinfouserInitialState>());
  });

  blocTest('emits new State when call Event',
      build: () => GitinfouserBloc(),
      act: (GitinfouserBloc bloc) => bloc.add(GetUsersEvent()),
      wait: const Duration(milliseconds: 300),
      expect: () => [isA<GitinfouserSetState>()]);

  test('testing called repository', () async {
    final repository = Repository(client: client);
    final result = await repository.getGitUsersAdvanced('dolph');

    expect(result, isA<List<GitUsersAdvanced>>());
  });
}
