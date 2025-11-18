part of 'similar_books_cubit.dart';

@immutable
sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarPaginationBooksLoading extends SimilarBooksState {}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  SimilarBooksFailure({required this.errMessage});
}

final class SimilarPaginationBooksFailure extends SimilarBooksState {
  final String errMessage;

  SimilarPaginationBooksFailure({required this.errMessage});
}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> booksList;

  SimilarBooksSuccess({required this.booksList});
}
