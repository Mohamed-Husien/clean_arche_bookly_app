part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedPaginationBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMessage;

  FeaturedBooksFailure({required this.errMessage});
}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> booksList;

  FeaturedBooksSuccess({required this.booksList});
}
