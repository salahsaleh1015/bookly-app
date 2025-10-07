class BookEntity {
  final String bookId;
  final String title;
  final String authorName;
  final String image;
  final num price;
  final num rate;

  BookEntity({
    required this.bookId,
    required this.title,
    required this.authorName,
    required this.image,
    required this.price,
    required this.rate,
  });
}
