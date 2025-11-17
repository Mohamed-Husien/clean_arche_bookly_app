import 'package:clean_arche_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arche_bookly_app/Features/home/domain/repo/home_repo.dart';
import 'package:clean_arche_bookly_app/core/error/failures.dart';
import 'package:clean_arche_bookly_app/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase
    extends SimilarUseCase<List<BookEntity>, int, String> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      {int params = 0, String category = ''}) {
    return homeRepo.fetchSimilarBooks(pageNumber: params, category: category);
  }
}
