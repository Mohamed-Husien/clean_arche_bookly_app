import 'package:clean_arche_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:clean_arche_bookly_app/core/utils/functions/custom_snack_bar.dart';
import 'package:clean_arche_bookly_app/core/widgets/custom_error_widget.dart';
import 'package:clean_arche_bookly_app/core/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBestSellerListViewBlocBuilder extends StatefulWidget {
  const CustomBestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  State<CustomBestSellerListViewBlocBuilder> createState() =>
      _CustomBestSellerListViewBlocBuilderState();
}

class _CustomBestSellerListViewBlocBuilderState
    extends State<CustomBestSellerListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.booksList);
        }
        if (state is NewestPaginationBooksFailure) {
          customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestPaginationBooksFailure ||
            state is NewestPaginationBooksLoading) {
          return BestSellerListView(
            books: books,
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const BookListViewItemSkeleton();
        }
      },
    );
  }
}
