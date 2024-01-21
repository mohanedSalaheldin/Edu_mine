class SectionEntity {
  final String description;
  final String title;
  final String url;
  final bool isWatched;
  final int number;

  SectionEntity(
      {required this.description,
      required this.title,
      required this.url,
      required this.isWatched,
      required this.number});
}
