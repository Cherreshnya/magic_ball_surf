
class ReadingAnswer {
  String title;

  ReadingAnswer(this.title);

  Map<String, dynamic> toJson() =>
      {
        "title" : title,
      };
}
