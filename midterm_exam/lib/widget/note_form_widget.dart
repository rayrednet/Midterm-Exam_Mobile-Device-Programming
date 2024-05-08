import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final String? reviewer;
  final String? openingHours;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedReviewer;
  final ValueChanged<String> onChangedOpeningHours;

  const NoteFormWidget({
    Key? key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
    this.reviewer = '',
    this.openingHours = '',
    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onChangedOpeningHours,
    required this.onChangedReviewer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Switch(
                        value: isImportant ?? false,
                        onChanged: onChangedImportant,
                      ),
                      Icon(
                        isImportant ?? false
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
              buildTitle(),
              const SizedBox(height: 8),
              buildReviewer(),
              const SizedBox(height: 8),
              buildOpeningHours(),
              const SizedBox(height: 16),
              buildDescription(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Place name...',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The title cannot be empty' : null,
        onChanged: onChangedTitle,
      );

  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: description,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter location...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedDescription,
      );

  Widget buildReviewer() => TextFormField(
        maxLines: 1,
        initialValue: reviewer,
        style: const TextStyle(color: Colors.white70, fontSize: 18),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Reviewer name...',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (value) =>
            value != null && value.isEmpty ? 'Reviewer cannot be empty' : null,
        onChanged: onChangedReviewer,
      );

  Widget buildOpeningHours() => TextFormField(
        maxLines: 1,
        initialValue: openingHours,
        style: const TextStyle(color: Colors.white70, fontSize: 18),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Opening hours...',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (value) => value != null && value.isEmpty
            ? 'Opening hours cannot be empty'
            : null,
        onChanged: onChangedOpeningHours,
      );
}
