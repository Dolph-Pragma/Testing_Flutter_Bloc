// To parse this JSON data, do
//
//     final usernameModel = usernameModelFromJson(jsonString);

import 'dart:convert';

GitUser usernameModelFromJson(String str) => GitUser.fromJson(json.decode(str));

String usernameModelToJson(GitUser data) => json.encode(data.toJson());

class GitUser {
  GitUser({
    required this.login,
    required this.avatarUrl,
    this.name,
    required this.publicRepos,
    required this.followers,
    required this.following,
  });

  String login;
  String avatarUrl;
  String? name;
  int publicRepos;
  int followers;
  int following;

  factory GitUser.fromRawJson(String str) => GitUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GitUser.fromJson(Map<String, dynamic> json) => GitUser(
        login: json["login"],
        avatarUrl: json["avatar_url"],
        name: json["name"],
        publicRepos: json["public_repos"],
        followers: json["followers"],
        following: json["following"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "avatar_url": avatarUrl,
        "name": name,
        "public_repos": publicRepos,
        "followers": followers,
        "following": following,
      };
}
