import 'package:clean_arche_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:clean_arche_bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_item.dart';

class SimilarBooksListview extends StatefulWidget {
  const SimilarBooksListview({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  State<SimilarBooksListview> createState() => _SimilarBooksListviewState();
}

class _SimilarBooksListviewState extends State<SimilarBooksListview> {
  late ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;
  String? category;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    if (!_scrollController.hasClients || !mounted) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    final threshold = maxScroll * 0.7; // 70% threshold

    if (currentScroll >= threshold) {
      if (!isLoading) {
        isLoading = true;

        await BlocProvider.of<SimilarBooksCubit>(context)
            .fetchSimilarBooks(pageNumber: nextPage++, category: category!);

        nextPage++;
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
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          category = widget.books[index].category;
          final book = widget.books[index];
          final imageUrl = book.image;
          const fallbackUrl =
              'https://basecamplive.com/wp-content/uploads/2023/02/books.jpeg';

          final safeImageUrl = (imageUrl != null && imageUrl.isNotEmpty)
              ? imageUrl
              : fallbackUrl;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.kBookDetailsView,
                  extra: book,
                );
              },
              child: CustomBookImage(
                image: safeImageUrl,
              ),
            ),
          );
        },
      ),
    );
  }
}
