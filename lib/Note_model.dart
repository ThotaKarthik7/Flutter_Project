class Note {
  final String title;

  Note({required this.title});

  Map<String, dynamic> toMap() => {'title': title};

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(title: map['title']);
  }
}
