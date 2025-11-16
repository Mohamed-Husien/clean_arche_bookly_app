import 'package:clean_arche_bookly_app/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:clean_arche_bookly_app/core/widgets/custom_error_widget.dart';
import 'package:clean_arche_bookly_app/core/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBestSellerListViewBlocBuilder extends StatelessWidget {
  const CustomBestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return BestSellerListView(
            books: state.booksList,
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
