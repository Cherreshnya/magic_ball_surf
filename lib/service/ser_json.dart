class ReadingResponce {
  final String answer;

  ReadingResponce(this.answer);

  factory ReadingResponce.fromJson(Map<String, dynamic> json) {
    return ReadingResponce(json["answer"]);
  }
}

