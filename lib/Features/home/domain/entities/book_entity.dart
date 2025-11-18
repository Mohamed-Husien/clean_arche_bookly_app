import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String bookId;
  @HiveField(2)
  final String? authorName;

  @HiveField(3)
  final String title;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;
  @HiveField(6)
  final String? category;

  BookEntity({
    required this.bookId,
    required this.image,
    required this.authorName,
    required this.title,
    required this.price,
    required this.rating,
    required this.category,
  });
}
