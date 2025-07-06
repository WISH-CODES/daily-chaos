class Challenge {
  final String title;
  final String description;

  Challenge({required this.title, required this.description});

  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }
}
