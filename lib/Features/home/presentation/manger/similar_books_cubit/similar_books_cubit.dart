import 'package:bloc/bloc.dart';
import 'package:clean_arche_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arche_bookly_app/Features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:meta/meta.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase)
      : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks(
      {int pageNumber = 0, String category = ""}) async {
    if (pageNumber == 0) {
      emit(SimilarBooksLoading());
    } else {
      emit(SimilarPaginationBooksLoading());
    }
    var result = await fetchSimilarBooksUseCase.call(
        params: pageNumber, category: category);

    result.fold(
      (failure) {
        emit(SimilarBooksFailure(errMessage: failure.errorMessage));
      },
      (books) {
        emit(
          SimilarBooksSuccess(booksList: books),
        );
      },
    );
  }
}
