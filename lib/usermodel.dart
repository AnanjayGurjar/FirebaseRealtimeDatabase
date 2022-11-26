import 'dart:convert';

class User {
  String name;
  int score;

  User(
    this.name,
    this.score,
  );

  User copyWith({
    String? name,
    int? score,
  }) {
    return User(
      name ?? this.name,
      score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'score': score});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['name'] ?? '',
      map['score']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, score: $score)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.score == score;
  }

  @override
  int get hashCode => name.hashCode ^ score.hashCode;
}
