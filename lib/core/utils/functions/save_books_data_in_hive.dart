import 'package:clean_arche_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksDataInHive(
    {required List<BookEntity> books, required String boxName}) {
  var box = Hive.box(boxName);
  box.addAll(books);
}
