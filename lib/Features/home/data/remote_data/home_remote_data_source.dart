import 'package:clean_arche_bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:clean_arche_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arche_bookly_app/core/utils/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free&q=subject:programming');

    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
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
