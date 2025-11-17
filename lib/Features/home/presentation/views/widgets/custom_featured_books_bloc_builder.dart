import 'package:clean_arche_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/views/widgets/custom_featured_box_loading_widget.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:clean_arche_bookly_app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFeaturedBooksBlocBuilder extends StatefulWidget {
  const CustomFeaturedBooksBlocBuilder({
    super.key,
  });

  @override
  State<CustomFeaturedBooksBlocBuilder> createState() =>
      _CustomFeaturedBooksBlocBuilderState();
}

class _CustomFeaturedBooksBlocBuilderState
    extends State<CustomFeaturedBooksBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.booksList);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedPaginationBooksLoading) {
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
