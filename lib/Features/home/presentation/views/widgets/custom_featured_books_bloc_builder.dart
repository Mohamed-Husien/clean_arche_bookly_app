import 'package:clean_arche_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/views/widgets/custom_featured_box_loading_widget.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:clean_arche_bookly_app/core/utils/functions/custom_snack_bar.dart';
import 'package:clean_arche_bookly_app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFeaturedBooksBlocConsumer extends StatefulWidget {
  const CustomFeaturedBooksBlocConsumer({
    super.key,
  });

  @override
  State<CustomFeaturedBooksBlocConsumer> createState() =>
      _CustomFeaturedBooksBlocConsumerState();
}

class _CustomFeaturedBooksBlocConsumerState
    extends State<CustomFeaturedBooksBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.booksList);
        }
        if (state is FeaturedPaginationBooksFailure) {
          customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedPaginationBooksLoading ||
            state is FeaturedPaginationBooksFailure) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomFeaturedBooksLoadingWidget(height: .3);
        }
      },
    );
  }
}
