import 'package:clean_arche_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arche_bookly_app/Features/home/domain/repo/home_repo.dart';
import 'package:clean_arche_bookly_app/Features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:clean_arche_bookly_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarBooksCubit(
        FetchSimilarBooksUseCase(
          homeRepo: getIt.get<HomeRepo>(),
        ),
      )..fetchSimilarBooks(category: bookEntity.category ?? "programming"),
      child: Scaffold(
        body: SafeArea(
          child: BookDetailsViewBody(
            bookEntity: bookEntity,
          ),
        ),
      ),
    );
  }
}
