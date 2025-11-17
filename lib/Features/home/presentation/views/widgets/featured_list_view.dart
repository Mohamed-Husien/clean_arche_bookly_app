import 'package:clean_arche_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  /// callback to call fetchFeaturedBooks()

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    final threshold = maxScroll * 0.7;

    if (currentScroll >= threshold) {
      if (!isLoading) {
        isLoading = true;
        BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          final imageUrl = widget.books[index].image;
          const fallbackUrl =
              'https://basecamplive.com/wp-content/uploads/2023/02/books.jpeg';

          final safeImageUrl = (imageUrl != null && imageUrl.isNotEmpty)
              ? imageUrl
              : fallbackUrl;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookImage(
              image: safeImageUrl,
            ),
          );
        },
      ),
    );
  }
}
