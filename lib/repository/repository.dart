import 'dart:convert';

import 'package:pragma_demos_gitinfouser/features/gitinfo/git_user.dart';
import 'package:pragma_demos_gitinfouser/features/gitinfo/git_users_advanced.dart';
import 'package:pragma_demos_gitinfouser/services/api.dart';
import 'package:http/http.dart' as http;

class Repository {
  final api = Api();
  http.Client? client;

  Repository({this.client});

  Future<GitUser> getGitUser(String username) async {
    final request = await api.getUser(client!, username);

    Map<String, dynamic> json = jsonDecode(request);

    final gitUser = GitUser(
      login: json["login"],
      avatarUrl: json["avatar_url"],
      name: json["name"],
      publicRepos: json["public_repos"],
      followers: json["followers"],
      following: json["following"],
    );

    return gitUser;
  }

  Future<List<GitUsersAdvanced>> getGitUsersAdvanced(String username) async {
    final List<GitUsersAdvanced> users = [];
    client ??= http.Client();

    final request = await api.getUsers(client!, username);

    Map<String, dynamic> decodeData = jsonDecode(request);

    if (decodeData.isEmpty) return users;

    for (var user in decodeData['items']) {
      final userTemp = GitUsersAdvanced(
        login: user["login"],
        avatarUrl: user["avatar_url"],
        id: user["id"],
        url: user["url"],
      );

      users.add(userTemp);
    }

    return users;
  }
}
