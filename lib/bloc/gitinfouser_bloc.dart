import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pragma_demos_gitinfouser/features/gitinfo/git_users_advanced.dart';

import 'package:pragma_demos_gitinfouser/repository/repository.dart';

part 'gitinfouser_event.dart';
part 'gitinfouser_state.dart';

class GitinfouserBloc extends Bloc<GitinfouserEvent, GitinfouserState> {
  GitinfouserBloc() : super(const GitinfouserInitialState());
}
