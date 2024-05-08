final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    id, isImportant, number, title, description, time, imagePath, rating, reviewer, openingHours,
  ];

  static const String id = '_id';
  static const String isImportant = 'isImportant';
  static const String number = 'number';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
  static const String imagePath = 'imagePath';
  static const String rating = 'rating';
  static const String reviewer = 'reviewer';
  static const String openingHours = 'openingHours';
}

class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;
  final String? imagePath;
  final double rating;
  final String reviewer;
  final String openingHours;

  const Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
    this.imagePath,
    this.rating = 0.0,
    required this.reviewer,
    required this. openingHours,
  });

  Note copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
    String? imagePath,
    double? rating,
  }) =>
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
        imagePath: imagePath ?? this.imagePath,
        rating: rating ?? this.rating,
        reviewer: reviewer ?? this.reviewer,
        openingHours: openingHours ?? this.openingHours,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        isImportant: json[NoteFields.isImportant] == 1,
        number: json[NoteFields.number] as int,
        title: json[NoteFields.title] as String,
        description: json[NoteFields.description] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
        imagePath: json[NoteFields.imagePath] as String?,
        rating: json[NoteFields.rating] as double? ?? 0.0,
        reviewer: json[NoteFields.reviewer] as String,
        openingHours: json[NoteFields.openingHours] as String,
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.isImportant: isImportant ? 1 : 0,
        NoteFields.number: number,
        NoteFields.description: description,
        NoteFields.time: createdTime.toIso8601String(),
        NoteFields.imagePath: imagePath,
        NoteFields.rating: rating,
        NoteFields.reviewer: reviewer,
        NoteFields.openingHours: openingHours,
      };
}
