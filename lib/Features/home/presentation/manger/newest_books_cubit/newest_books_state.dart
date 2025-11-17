part of 'newest_books_cubit.dart';

@immutable
sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}

final class NewestPaginationBooksLoading extends NewestBooksState {}

final class NewestBooksFailure extends NewestBooksState {
  final String errMessage;

  NewestBooksFailure({required this.errMessage});
}

final class NewestPaginationBooksFailure extends NewestBooksState {
  final String errMessage;

  NewestPaginationBooksFailure({required this.errMessage});
}

final class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> booksList;

  NewestBooksSuccess({required this.booksList});
}
