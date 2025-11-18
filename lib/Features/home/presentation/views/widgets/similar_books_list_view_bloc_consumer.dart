import 'package:clean_arche_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/views/widgets/custom_featured_box_loading_widget.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:clean_arche_bookly_app/core/utils/functions/custom_snack_bar.dart';
import 'package:clean_arche_bookly_app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListViewBlocConsumer extends StatefulWidget {
  const SimilarBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<SimilarBooksListViewBlocConsumer> createState() =>
      _SimilarBooksListViewBlocConsumerState();
}

class _SimilarBooksListViewBlocConsumerState
    extends State<SimilarBooksListViewBlocConsumer> {
  List<BookEntity> booksList = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if (state is SimilarBooksSuccess) {
          booksList.addAll(state.booksList);
        }
        if (state is SimilarBooksFailure) {
          customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksSuccess ||
            state is SimilarPaginationBooksFailure ||
            state is SimilarPaginationBooksLoading) {
          return SimilarBooksListview(
            books: booksList,
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomFeaturedBooksLoadingWidget(height: .15);
        }
      },
    );
  }
}
