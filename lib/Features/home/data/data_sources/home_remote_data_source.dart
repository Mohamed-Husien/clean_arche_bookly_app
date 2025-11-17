import 'package:clean_arche_bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:clean_arche_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arche_bookly_app/constants.dart';
import 'package:clean_arche_bookly_app/core/utils/api_service.dart';
import 'package:clean_arche_bookly_app/core/utils/functions/save_books_data_in_hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?q=subject:programming&startIndex=${pageNumber * 10}');

    List<BookEntity> books = getBooksList(data);

    saveBooksDataInHive(books: books, boxName: kFeaturedBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Sorting=newest&q=subject:programming&startIndex=${pageNumber * 10}');

    List<BookEntity> books = getBooksList(data);
    saveBooksDataInHive(books: books, boxName: kNewestBooks);
    return books;
  }

//------------------------------------------------------------------------------
  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];

    for (var bookMap in data['items']) {
      books.add(
        BookModel.fromJson(bookMap),
      );
    }
    return books;
  }
}
