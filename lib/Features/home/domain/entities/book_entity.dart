class BookEntity {
  final String? image;
  final String bookId;
  final String? authorName;
  final String title;
  final num? price;
  final num? rating;

  BookEntity(
      {required this.bookId,
      required this.image,
      required this.authorName,
      required this.title,
      required this.price,
      required this.rating});
}
